(ns basketball-world.core
  (:require [compojure.core :refer :all]
            [compojure.route :as route]
            [ring.middleware.defaults :refer [wrap-defaults site-defaults api-defaults]]
            [controller.view-controller :as controller]
            [service.teams :as teams]
            [service.players :as players]
            [service.roles :as roles]
            [ring.util.response :as response]
            [ring.middleware.basic-authentication :refer :all]
            [clojure.java.jdbc :as jdbc]
            [clojure.edn :as edn]))

(def db (edn/read-string (slurp "configuration/init-db.edn")))

(defn create-db-connection []
  (jdbc/db-do-commands
    {:connection-uri (format "jdbc:%s://%s/%s?user=%s&password=%s"
                             (db :adapter) (db :server-name)
                             (db :database-name) (db :user-name)
                             (db :password))}
    (read-string (slurp (format "src/scripts/%s"
                                (db :init-file-name))))))


(defn init []
  (jdbc/db-do-commands {:connection-uri (format "jdbc:%s://%s?user=%s&password=%s"
                                             (db :adapter) (db :server-name)
                                             (db :user-name) (db :password))}
                    false
                    (format "CREATE DATABASE IF NOT EXISTS %s", (db :database-name)))
  (create-db-connection))

(defroutes app
           (GET "/teams" [] (controller/teams))
           (route/resources "/")

           (GET "/teams/create" [] (controller/create-team))
           (route/resources "/")

           (GET "/teams/:id/update" [id] (controller/update-team id))

           (GET "/api/teams/:id/delete" [id]
             (do (teams/delete id)
                 (response/redirect "/teams")))
           (route/resources "/")

           (POST "/api/teams/create" [& params]
             (do (teams/create params)
                 (response/redirect "/teams")))

           (POST "/api/teams/:id/update" [& params]
             (do (teams/update (:id params) params)
                 (response/redirect "/teams")))

           (GET "/players" [] (controller/players))
           (route/resources "/")

           (GET "/players/create" [] (controller/create-player))
           (route/resources "/")

           (GET "/players/:id/update" [id] (controller/update-player id))

           (GET "/api/players/:id/delete" [id]
             (do (players/delete id)
                 (response/redirect "/players")))
           (route/resources "/")

           (POST "/api/players/create" [& params]
             (do (players/create params)
                 (response/redirect "/players")))

           (POST "/api/players/:id/update" [& params]
             (do (players/update (:id params) params)
                 (response/redirect "/players")))

           (GET "/roles" [] (controller/roles))
           (route/resources "/")

           (GET "/roles/create" [] (controller/create-role))
           (route/resources "/")

           (POST "/api/roles/create" [& params]
             (do (roles/create params)
                 (response/redirect "/roles")))

           (GET "/" [] (response/redirect "/teams"))

           (route/not-found "404 Not Found"))

(def -main
  (wrap-defaults app api-defaults))

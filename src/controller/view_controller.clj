(ns controller.view-controller
  (:require [clostache.parser :as parser]
            [clojure.java.io :as io]
            [service.teams :as teams]
            [service.country :as countries]
            [service.players :as players]
            [service.roles :as roles]))

(defn load-template [template-name]
  (slurp (io/resource
           (str "templates/"template-name".mustache"))))

(defn render-template [file data]
  (parser/render (load-template file) data))

(defn teams []
  (render-template "teams" {:teams (teams/get-all)}))

(defn create-team []
  (render-template "create-team" {:countries (countries/get-all)}))

(defn update-team [id]
  (render-template "update-team" {:team (teams/get id)
                                   :countries (countries/get-all)}))

(defn players []
  (render-template "players" {:players (players/get-all)}))

(defn create-player []
  (render-template "create-player" {:countries (countries/get-all)}))

(defn update-player [id]
  (render-template "update-player" {:player (players/get id)
                                   :countries (countries/get-all)}))

(defn roles []
  (render-template "roles" {:roles (roles/get-all)}))

(defn create-role []
  (render-template "create-role" {:players (players/get-all)
                                  :teams (teams/get-all)}))

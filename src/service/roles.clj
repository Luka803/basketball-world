(ns service.roles
  (:refer-clojure :exclude [seqable? get update])
  (:require [clojure.java.jdbc :as jdbc]
            [clojure.edn :as edn]))

(def db (edn/read-string (slurp "configuration/db.edn")))

(defn get-all []
  (jdbc/query db
              ["SELECT r.*, m.name as team, a.name as player
                FROM role r JOIN team m on (r.id_team = m.id)
                JOIN player a on (r.id_player = a.id)"]))

(defn get [id]
  (first (jdbc/query db ["SELECT *
                          FROM role
                          WHERE id = ?" id])))

(defn create [parameters]
  (jdbc/insert! db :role parameters))

(defn delete-by-player [id-player]
  (jdbc/delete! db :role ["id_player = ?" id-player]))

(defn delete-by-team [id-team]
  (jdbc/delete! db :role ["id_team = ?" id-team]))

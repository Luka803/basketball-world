(ns service.teams
  (:refer-clojure :exclude [seqable? get update])
  (:require [clojure.java.jdbc :as jdbc]
            [clojure.edn :as edn]
            [service.roles :as roles]))

(def db (edn/read-string (slurp "configuration/db.edn")))

(defn get-all []
  (jdbc/query db
              ["SELECT m.*, c.name as country
                FROM team m JOIN country c on (m.id_country = c.id)"]))

(defn get [id]
  (first (jdbc/query db ["SELECT *
                          FROM team
                          WHERE id = ?" id])))

(defn delete [id]
  (do (roles/delete-by-team id)
      (jdbc/delete! db :team ["id = ?" id])))

(defn create [parameters]
  (jdbc/insert! db :team parameters))

(defn update [id parameters]
  (jdbc/update! db :team parameters ["id = ?" id]))

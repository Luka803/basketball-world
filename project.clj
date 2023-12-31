(defproject basketball-world "0.1.0-SNAPSHOT"
  :description "Basketball world"
  :url "https://github.com/Luka803/basketball-world.git"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[org.clojure/clojure "1.11.1"]
                 [ring "1.9.5"]
                 [ring-server "0.5.0"]
                 [compojure "1.6.3"]
                 [ring/ring-defaults "0.3.3"]
                 [ring-basic-authentication "1.1.1"]
                 [de.ubercode.clostache/clostache "1.4.0"]
                 [org.clojure/java.jdbc "0.7.12"]
                 [mysql/mysql-connector-java "8.0.21"]]
  :plugins [[lein-ring "0.12.6"]]
  :ring {:handler basketball-world.core/-main
         :init basketball-world.core/init
         :port 8080}
  :repl-options {:init-ns basketball-world.core})

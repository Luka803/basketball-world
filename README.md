# Basketball teams management application in Clojure

Basketball-world is the CRUD Web application implemented in Clojure. The application uses Mustache logic-less templates for html pages. For the CSS there is custom typed CSS and the Bootstrap for the most of the CSS. The application is about Euroleague basketball teams. You can create, update and delete Euroleague team which has name, year when they were founded and achievements of the team. You can also create, update and delete player. At the end, you can create role of the player in the team. You can choose between five positions:

1. Point Guard
2. Shooting Guard
3. Forward
4. Power forward
5. Center

There is no limit for number of positions per team. Every player can be added only to the one team. Beacuse of its relationship between entities if we delete a player who has role in some team, that role will also be deleted. Same behaviour we can see in relationship team-role. After deleting team, all roles connected to that team will also be deleted. 

## Requirements

You first have to set up MySql database server. Script for the database is located in the project src/scripts/init.sql. Install Leiningen. Leiningen is a build automation and project management tool for Clojure, a dynamic programming language that runs on the Java Virtual Machine (JVM). Leiningen simplifies the process of setting up, managing, and building Clojure projects. It provides a unified way to handle dependencies, compile code, run tests, and package projects. Because of ecosystem where i created application (VS Code), i used Calva extension which provides a set of tools and featues to enhance the development experience for Clojure developers. I used Calva mostly of its Integrated REPL (Read-Eval-Print Loop), which help me testing my app in real time.


## Usage

In configuration/db.edn and configuration/init-db.edn you can change MySql connection parameters to match the ones on your machine.
In project.clj you can change the port on which the application is running (Use the port that is not taken from another proccess). For running the application, run this command from terminal in your project location.


`` 
lein ring server 

``

## Sources


[1] https://clojure.org/api/cheatsheet

[2] https://github.com/bbatsov/clojure-style-guide

[3] https://www.tutorialspoint.com/clojure/index.htm

[4] https://github.com/clojure/clojure

[5] https://github.com/Zookey/Book.git 

[6] 



## License

Copyright © 2022 FIXME

This program and the accompanying materials are made available under the
terms of the Eclipse Public License 2.0 which is available at
http://www.eclipse.org/legal/epl-2.0.

This Source Code may also be made available under the following Secondary
Licenses when the conditions for such availability set forth in the Eclipse
Public License, v. 2.0 are satisfied: GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or (at your
option) any later version, with the GNU Classpath Exception which is available
at https://www.gnu.org/software/classpath/license.html.

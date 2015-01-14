The work is based on https://github.com/tpires/docker-sonar

# SonarQube Overview

SonarQube is an open platform to manage code quality.

The SonarQube platform is made of 3 components:

1. One Database to store (sonar-mysql)
2. One Web Server for users to browse quality snapshots and configure the SonarQube instance (sonar-server)
3. One or more Analyzers to analyze projects.(sonar-runner)

http://www.sonarqube.org/

http://docs.sonarqube.org/display/SONAR/Documentation

# Database

## Setup 
Run the database image `neroinc/sonar-mysql`. It is directly based of `tpires/sonar-mysql`.
Give it a name so it can be later linked with the sonar-server:

`docker run -i -t -d -p 3306:3306 --name smysql neroinc/sonar-mysql`

## Default user and password

Default user and password for mysql is `sonar:123qwe`.

# Web Server 

## Setup
`tpires/sonar-server` is out of date. Therefore we rebuild it as `neroinc/sonar-server`. 
You can pull it directly from the docker hub or build manually with the Dockerfile.

Run web server and link it with the database. That link will be named "db".

`docker run -i -t -d --name sonar -p 9000:9000 --link smysql:db neroinc/sonar-server`

## Default user and password

Default user and password for web server is `admin:admin`.

You can now access to sonar-server by opening your browser to `http://localhost:9000`. 
(for Mac and Windows users, replace `localhost` with docker VM ip, you can get it by run: `boot2docker ip`)

## Plugins
All plugins locates at `sonar-server/plugins/` are installed by default.

Official Java and C# language is free, however offical C\C++ and Objective C langualge plugin is commercial licenses base(Not Free!), we added free communitiy plugin instead for now.

### C\C++ plugin
https://github.com/wenns/sonar-cxx

### Objective C plugin
https://github.com/octo-technology/sonar-objective-c

# Sonar-Runner
Download sonar-runner from http://www.sonarqube.org/downloads/, extracted to `$Sonar-Runner-Home`.

Repalce `$Sonar-Runner-Home\conf\sonar-runner.properties` by `sonar-runner\sonar-runner.properties`

then uncomment properties: `sonar.host.url` and `onar.jdbc.url`, properly configure `localhost` with your web server ip.

# Analysis
In the root of project `$Project_Home`, create and properly configure `sonar-project.properties`

`cd $Project_Home`

execute `$Sonar-Runner-Home\bin\sonar-runner`


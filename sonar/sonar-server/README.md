sonar-server
============
The work is based on https://github.com/tpires/docker-sonar

First you need to configure `sonar-mysql` and name it `smysql`.

Now you need to run the server and link it with the database. That link will be named `db`.

`docker run -i -t -d –name sonar -p 9000:9000 –link smysql:db neroinc/sonar-server`

You can now access to sonar-server by opening your browser to http://localhost:9000.
Default username:password is `admin:admin`.

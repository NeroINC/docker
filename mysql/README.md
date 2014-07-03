This installs MySQL Community Server v5.6.19 and will update automatically.

Build: docker build -rm -t nutzername/MySQL .

Run: docker run -d -p 3306:3306 nutzername/MySQL

MySQL PW is: mysqlPassword

Get IP address for container:
docker inspect <container_id> | grep -i ipaddr

Connect:
mysql -h 172.17.0.x -utestdb -p mysqlPassword

Create a table:
\> CREATE TABLE test (name VARCHAR(10), owner VARCHAR(10),
    -> species VARCHAR(10), birth DATE, death DATE);

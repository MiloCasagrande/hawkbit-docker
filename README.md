Run Hawkbit in a Docker Container
=================================

* For info about Hawkbit see: https://github.com/eclipse/hawkbit/

Build the Image
===============

You might want to change some values from the default ones used in the configuration
files.

Look at the [application.properties](./application.properties) file and change:

* Default RabbitMQ username and password (`spring.rabbitmq.username` `spring.rabbitmq.password`) (if different).
* MariaDB URL, username and password (`spring.datasource.url` `spring.datasource.username` `spring.datasource.password`), and the name of the database used.
* MongoDB URI (`spring.data.mongodb`).
* The Hawkbit password and user (`hawkbit.server.ui.demo.password`, `hawkbit.server.ui.demo.user`).

The image can take a while to build.

    docker build -t hawkbit --force-rm .

Run the Container
=================

Start a MariaDB container as explained in the [offial container image documentation](https://hub.docker.com/_/mariadb/).

You need to specify the `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_DATABASE` values,
and those should be reflected in the `application.properties` file.

    docker run -d -t --name mariadb -e MYSQL_ROOT_PASSWORD=ROOT_PASSWORD -e MYSQL_USER=USER_NAME -e MYSQL_PASSWORD=USER_PASSWORD -e MYSQL_DATABASE=DB_NAME mariadb

When MariaDB is up and running, start the Hawkbit container and link the MariaDB one.

    docker run -d -t --name hawkbit --link mariadb:mysql -p 8080:8080 milocasagrande/hawkbit-docker

Once the container is up and running and the application started (in can take
~20 seconds for the application to start), head to http://localhost:8080/UI and
login with the Hawkbit username and password configured (by default admin/admin).

From here on:

> Hic sunt dracones

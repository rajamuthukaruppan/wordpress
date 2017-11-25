## Northwind Database Application

This Angular 4 / Java JPA / Spring Boot application is based on the classic Northwind database. Some of us remember this database when working with Microsoft products. This application aims to evolve into something that could be installed on your own EC2 instance so you can self host this application.

The database is implemented in H2 using Flyway Database migration tool however you can customize to run on any database.

To start login to the UI in development
* look at where your database is expected to be in src/main/resources/application.properties `spring.datasource.url`
* Start the server in your console `npm start`
* Start the app server by running the main Java Class com.test.SpringBootstrap
* [Application URL](http://localhost:4200/main)

To login to the H2 database navigate to the following url:
* [H2 DB Console](http://localhost:8080/northwindService/v1/h2-console/)


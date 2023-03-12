# Dockerize a PHP/MySQL App

## Installation
````
$ mkdir YourProject
$ cd YourProject
$ git clone https://github.com/dahas/DockerPhpApp.git .
````

## Change docker-compose.yml

Open `docker-compose.yml` and change the following parameters according your needs:
````
services:
  db:
    ...
    environment:
      MYSQL_USER: <add your username here>
      MYSQL_PASSWORD: <add your password here>
      MYSQL_DATABASE: <add name of database here>
      MYSQL_ROOT_PASSWORD: <add root password here>
    ...
  app:
    ...
    image: <add your docker hub username here>/php81
````

## Run container
````
$ docker compose up -d --build
````

## Open App in Browser
http://localhost:8000/

## Open MySQL DB Adminer
http://localhost:8080/

## Create your App

Empty the `src` folder and put all files of your Application into it. Make sure your App has a `public` folder where the Apache can serve from.


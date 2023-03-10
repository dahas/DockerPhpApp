# How to create a Docker image from scratch

Learn how to create a development environment containing PHP and MySQL with Docker.

## Installation
Download and install **Docker Desktop** from here: https://www.docker.com/get-started/

## Create a folder for your Project
````
$ mkdir DockerProject
$ cd DockerProject
````

## Create a folder for your App
````
$ mkdir src
````

## Create an in index.php file
````
$ cd src
$ touch index.php
````
Insert:
````php
<?php
echo "Hello Docker!";
````

# The Dockerfile

The Dockerfile is where you set up your image.

## Include PHP

Open https://hub.docker.com/ and search for "PHP". Read the description. Choose a supported tag. I'll use the latest version with an Apache Server attached: *8.2.3-apache*.

Create the Dockerfile in the root folder of the Project:
````
$ cd ..
$ touch Dockerfile
````

Insert the following lines:
````
FROM php:8.2.3-apache
COPY src/ /var/www/html/
EXPOSE 8000
````

## Build Image and Run Container

With the -t Switch we add the Tag *username/img_name* to our image:
````
$ docker build -t dahas68/dev_stack .
````
````
$ docker run -p 8000:80 dahas68/dev_stack
````

# Docker Compose

Consider Docker Compose as a set of instructions to build and run multiple containers at once. 

Create the `docker-compose.yml` file:
````
$ touch docker-compose.yml
````

Insert the following lines:
````yml
version: "3.8"
services:
  db:
    image: mariadb
    restart: always
    environment:
      MYSQL_USER: dahas
      MYSQL_PASSWORD: bavaria
      MYSQL_DATABASE: test
      MYSQL_ROOT_PASSWORD: root
    ports:
      - 3306:3306
    volumes:
      - db_data:/var/lib/mysql
  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080
    depends_on:
      - db
  site:
    container_name: php82
    image: dahas68/php82
    build:
      context: ./
    ports:
      - 8000:80
    depends_on:
      - db
volumes:
  db_data:
````
* version: The Version of Docker Compose (Currently 3).
* services: Contains all the tools/services you intend to run.
    * my_stack: Any name you like. Will be used to communicate with other containers.

Validate configuration:
````
$ docker compose config
````

Run it:
````
$ docker compose up
````

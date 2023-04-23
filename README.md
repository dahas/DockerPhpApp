# Dockerize a PHP/MySQL App

## Installation
````
$ mkdir YourProject
$ cd YourProject
$ git clone https://github.com/dahas/DockerPhpApp.git .
````

## Setting it up

Rename `.env.example` to `.env` and replace the placeholders with the corresponding settings.

## Run Docker and build the container
````
$ docker compose up -d --build
````

## Create your App

- Grant permissions on `source` folder:
  ````
  $ sudo chown -R <user>:<user> source/
  ````
- Put (clone) your Apps resources into `source` folder.
- Your App requires a `public` folder where the Apache can serve from.
- Instead of *localhost* or *127.0.0.1* use **db** (the service name) as MySQL host.

## Open App in Browser
http://localhost:2400/

## Open MySQL DB Admin Tool
http://localhost:8000/

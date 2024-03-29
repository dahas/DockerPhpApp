# Dockerized LAMP Stack
- PHP 8.1.2
- Composer
- MariaDB
- Apache

## Installation
````
$ git clone https://github.com/dahas/DockerPhpApp.git <your_folder>
$ cd <your_folder>
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
  $ sudo chown -R $USER:$GROUP source/
  ````
- Put (or clone) your Apps resources into the `source` folder.
- Your App requires a `public` folder where the Apache can serve from.
- Instead of *localhost* or *127.0.0.1* use **db** (the service name) as MySQL host.

## Open App in Browser
http://localhost:2400/

## Open MySQL DB Admin Tool
http://localhost:8000/

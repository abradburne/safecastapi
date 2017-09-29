Installing Safecast API using Docker
------------------------------------

This will setup Safecast API server your local machine using Docker and Docker Compose.

You must have Docker and docker-compose installed. Tested using Docker v 17.09.0 and docker-compose 1.16.1

#### Setting up the Docker images

Clone the Safecast repo and perform the following commands from the safecastapi directory.

1. Build the Safecast API app docker image

```
$ docker build -t safecast_api .
```

2. Build and start up the PostgreSQL image with PostGIS extensions

```
$ docker-compose up -d postgres
```

3. Setup the db

First we have to set the database hostname in the config/database.yml file.
For the development and test databases, add the following:

```
host: postgres
```

Then setup the development database with the commands:

```
$ docker-compose run api rake db:drop
$ docker-compose run api rake db:setup
$ docker-compose run api rake db:bootstrap
```

and the test db:

```
$ docker-compose exec api env RAILS_ENV=test rake db:create
$ docker-compose exec api env RAILS_ENV=test rake db:setup
```

4. Start the Safecast API app

The following command will ensure the database is running and start the Rails application container, which will automatically start the rails server process.

```
$ docker-compose up
```

This will stay connected to the container and display the container output in the terminal window.

#### Working with the dockerized application

You can run commands on the Rails application container using the command `docker-compose exec api <COMMAND>`, for example:

### Run Tests

```
$ docker-compose exec api env RAILS_ENV=test rake spec
```

### Access the Rails console

```
$ docker-compose exec api rails c
```

### Connect to psql

```
$ docker-compose exec postgres psql -h postgres -U safecast safecast_development
```

#### Stopping and Deleting the containers

### Stopping the containers

To gracefully shutdown the containers, enter the following command in another terminal window:
```
docker-compose stop
```

You can delete the containers using
```
docker-compose down
```
This will not delete the database volume.
Postgres data is stored in the docker data volume `safecastapi_pgdata`
You can delete this with:

```
$ docker volume rm safecastapi_pgdata
```

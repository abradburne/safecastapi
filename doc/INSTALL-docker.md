Installing Safecast API using Docker
------------------------------------

This will setup Safecast API server your local machine using Docker and Docker Compose.

You must have Docker and docker-compose installed. Tested usnig Docker v 17.09.0 and docker-compose 1.16.1

#### Setting up the Docker images

1. Build the Safecast API app docker image

```
$ docker build -t safecast_api .
```

2. Install and start up the PostgreSQL image with PostGIS extensions

```
$ docker-compose up -d postgres
```

3. Setup the db

```
$ docker-compose run api rake db:drop
$ docker-compose run api rake db:setup
$ docker-compose run api rake db:bootstrap
```

4. Start the Safecast API app

```
$ docker-compose up
```

#### Controlling the dockerized application

### Access the Rails console

```
$ docker-compose run api rails c
```

### Connect to psql

Postgres password is set to 'secret'

```
$ docker-compose run postgres psql -h postgres -U safecast safecast_development
```

Postgres data is stored in the docker data volume `safecastapi_pgdata`
You can delete with:

```
$ docker volume rm safecastapi_pgdata
```

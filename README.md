# docker-scripts
My custom scripts to do stuff with docker...

# Scripts
Just chmod+x and run.

# Docker compose
Start:
```
docker-compose -f postgresql.yml up -d
```
Stop:
```
docker-compose -f postgresql.yml down
```


# Docker

## MysQL
```
sudo docker run -it -d --name mysql-container -p 3306:3306 --network techbankNet -e MYSQL_ROOT_PASSWORD=techbankRootPsw --restart always -v mysql_data_container:/var/lib/mysql mysql:latest
```

## Mongo
```
sudo docker run -it -d --name mongo-container -p 27017:27017 --network techbankNet --restart always -v mongodb_data_container:/data/db mongo:latest
```

## Create Docker Network - techbankNet 
```
docker network create --attachable -d bridge techbankNet
```

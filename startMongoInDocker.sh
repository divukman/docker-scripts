#!/bin/sh
# Continue existing container or start a new one...

imageName="dimitar-mongo"

getContainerId () {
	id=`docker ps -a -f name=dimitar-mongo | grep -w "$imageName" | awk '{print $1}'`
}

tailLogs () {
	docker logs -f "$id"
}

getContainerId

echo "$id"
if [ -n "$id" ];
then
	echo "Container already exists with ID: $id"
	echo "Starting container..."
	docker start "$id"
	tailLogs
else
	echo "Starting new container..."
	docker run -d -v /home/dimitar/docker_volumes/dimitar_mongo:/data/db -p 27017-27019:27017-27019 --name "$imageName" mongo
#	getContainerId
#	tailLogs
fi

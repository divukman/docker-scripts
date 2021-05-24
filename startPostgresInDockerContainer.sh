#!/bin/sh
# Continue existing container or start a new one...

imageName="dimitar-postgresql"

getContainerId () {
	id=`docker ps -a -f name=dimitar-postgresql | grep -w "$imageName" | awk '{print $1}'`
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
	docker run -P --env POSTGRES_HOST_AUTH_METHOD=trust --name "$imageName" -v /home/dimitar/docker_volumes/dimitar_postgres_01:/var/lib/postgresql/data -d postgres
	getContainerId
	tailLogs
fi

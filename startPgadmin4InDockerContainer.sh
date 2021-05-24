# NB when setting connection to localhost, use host ip for this container
# HOST: 172.17.0.1
# username: postgres
# password: leave blank
# port 32768
docker run -p 80:80 \
    -e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' \
    -e 'PGADMIN_DEFAULT_PASSWORD=SuperSecret' \
    -d dpage/pgadmin4

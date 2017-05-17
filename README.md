```sh
docker-compose --project-name mf up --build --scale db=3

docker-compose --project-name mf exec manager tail -f /var/log/failover.log
```

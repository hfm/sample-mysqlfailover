```sh
docker-compose --project-name mf up --build --scale db=3 -d
```

```
mysqlrpladmin --master=root@mf_db_1 --slaves=root@mf_db_2,root@mf_db_3 --new-master=root@mf_db_2 --demote-master failover

# mysqlrpladmin --master=root@mf_db_1 --slaves=root@mf_db_2,root@mf_db_3 --new-master=root@mf_db_2 --demote-master switchover
# mysqlrpladmin --master=root@mf_db_1 --slaves=root@mf_db_2,root@mf_db_3 --new-master=root@mf_db_2 --demote-master failover
```

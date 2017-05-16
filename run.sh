#!/bin/bash

set -e

mysql -h mf_db_1 -e 'SET GLOBAL server_id=1'
mysql -h mf_db_2 -e 'SET GLOBAL server_id=2'
mysql -h mf_db_3 -e 'SET GLOBAL server_id=3'

mysqlreplicate --master=root@mf_db_1 --slave=root@mf_db_2 --rpl-user=root --start-from-beginning
mysqlreplicate --master=root@mf_db_1 --slave=root@mf_db_3 --rpl-user=root --start-from-beginning

sleep 5

mysqlrplcheck --master=root@mf_db_1 --slave=root@mf_db_2
mysqlrplcheck --master=root@mf_db_1 --slave=root@mf_db_3
mysqlrpladmin --master=root@mf_db_1 --slaves=root@mf_db_2,root@mf_db_3 health -v

exec mysqlfailover --master=root@mf_db_1 --slaves=root@mf_db_2,root@mf_db_3 --rpl-user=root --log=/var/log/failover.log --daemon=nodetach --force

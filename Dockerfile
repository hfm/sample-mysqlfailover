FROM centos:7
MAINTAINER OKUMURA Takahiro <hfm.garden@gmail.com>

RUN rpm -U https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm && yum install -y -q mysql-utilities mysql-community-client
ADD wait-for-it.sh .
ADD run.sh .
CMD ["./wait-for-it.sh", "mf_db_1", "--", "./run.sh"]

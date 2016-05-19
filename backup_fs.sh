#!/bin/bash
DATA=`date +%F-%k%m` #pega data atual
TIME_BKCP=+5 #número de dias em que será deletado o arquivo de backup

tar -cvzf /backup/backup_filesystem_"$DATA".tar.gz -C / sites/wordpress


#apagando arquivos mais antigos (há mais de 5 dias)
find /backup -name "b*" -ctime $TIME_BKCP -exec rm -f {} \;


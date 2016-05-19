# Definindo parametros do MySQL
echo "  -- Definindo parametros do MySQL ..."
DB_NAME='wordpress'
DB_USER='wordpress'
DB_PASS='teste@1234'


# Definindo parametros do sistema
echo "  -- Definindo parametros do sistema ..."
DATA=`date +%F-%k%M`
MYSQLDUMP=/usr/bin/mysqldump
TIME_BKCP=+5

#Gerando arquivo sql
echo "  -- Gerando Backup da base de dados $DB_NAME em $BACKUP_DIR$BACKUP_NAME ..."
$MYSQLDUMP $DB_NAME -u $DB_USER -p$DB_PASS > /backup/mysql-"$DATA".sql

# Compactando arquivo em tar.gz
echo "  -- Compactando arquivo em tar ..."
tar -cvzf /backup/mysql-"$DATA".tar.gz -C backup/mysql-"$DATA".sql

#apagando arquivos mais antigos (há mais de 5 dias)
find /backup -name "m*" -ctime $TIME_BKCP -exec rm -f {} \;


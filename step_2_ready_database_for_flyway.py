#!/usr/bin/env python
import os

os.system('figlet -w 160 -f standard "Ready Database for Flyway"')

os.system('echo "CREATE USER FLYWAY IDENTIFIED BY FLYWAY;" | sqlplus system/oracle@localhost:1521/xe > /dev/null')
os.system('echo "GRANT CREATE SESSION, CREATE ANY TABLE, CREATE ANY INDEX, CREATE ANY SEQUENCE, CREATE ANY VIEW, RESOURCE, DBA TO FLYWAY;" | sqlplus system/oracle@localhost:1521/xe > /dev/null')
os.system('echo "GRANT UNLIMITED TABLESPACE TO FLYWAY;" | sqlplus system/oracle@localhost:1521/xe > /dev/null')
#!/bin/bash
OPCIONES="RESERVAS TRASLADOS"
	select opt in $OPCIONES; do
	if [ "$opt" = "RESERVAS" ]; then
		read -p "Ingrese usuario: " DB_USER
		read -sp "Ingrese password: " DB_USER_PSSWD
		read -p "Ingrese host: " DB_HOST
		mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD  -e "use Hotel;" -e "select * from Reservas;"
		exit
	fi
	if [ "$opt" = "TRASLADOS" ]; then
		read -p "Ingrese usuario: " DB_USER
		read -sp "Ingrese password: " DB_USER_PSSWD
		read -p "Ingrese host: " DB_HOST
		mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD  -e "use Hotel;" -e "select * from Traslados;"
		exit
	fi
	exit
	
	done

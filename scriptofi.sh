#!/bin/bash
OPCIONES="RESERVAS TRASLADOS"
	select opt in $OPCIONES; do
	if [ "$opt" = "RESERVAS" ]; then
		ACCION="INGRESAR MODIFICAR CONSULTAR"
		select opt in $ACCION; do
		if [ "$opt" = "INGRESAR" ]; then
			read -p "Ingrese usuario: " DB_USER
			read -sp "Ingrese password: " DB_USER_PSSWD
			read -p "Ingrese host: " DB_HOST
			read -p "Ingrese tipo de habitacion: " ROOM_KIND
			read -p "Ingrese nombre del solicitante: " NAME_BOOK
			read -p "Ingrese cantidad de mascotas: " PETS
			read -p "Ingrese dia de reserva: " BOOKDAY
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "insert into Reservas values ('$ROOM_KIND', '$NAME_BOOK', $PETS, '$BOOKDAY')"
			exit
		fi
		if [ "$opt" = "MODIFICAR" ]; then
			read -p "Ingrese usuario: " DB_USER
			read -sp "Ingrese password: " DB_USER_PSSWD
			read -p "Ingrese host: " DB_HOST
			read -p "Ingrese la columna que quiere modificar: " COLUMN
			read -p "Ingrese el dato que va en la 1ra columna: " COLUMN_INFO
			read -p "Ingrese nombre del solicitante de la reserva: " NAME_BOOK
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "update Reservas set $COLUMN = '$COLUMN_INFO' where Nombre = '$NAME_BOOK' "
		exit
		fi
		if [ "$opt" = CONSULTAR ]; then
			read -p "Ingrese usuario: " DB_USER
			read -sp "Ingrese password: " DB_USER_PSSWD
			read -p "Ingrese host: " DB_HOST
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD  -e "use Hotel;" -e "select * from Reservas;"
			exit
		fi
		done
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


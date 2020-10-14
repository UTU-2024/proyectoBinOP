#!/bin/bash

			read -p "Ingrese usuario: " DB_USER
			read -sp "Ingrese password: " DB_USER_PSSWD
			read -p "Ingrese host: " DB_HOST

OPCIONES="RESERVAS TRASLADOS"
	select opt in $OPCIONES; do
	if [ "$opt" = "RESERVAS" ]; then
		ACCION="INGRESAR MODIFICAR CONSULTAR"
		select opt in $ACCION; do
		if [ "$opt" = "INGRESAR" ]; then
			read -p "Ingrese tipo de habitacion: " ROOM_KIND
			read -p "Ingrese nombre del solicitante: " NAME_BOOK
			read -p "Ingrese cantidad de mascotas: " PETS
			read -p "Ingrese dia de reserva en formato AAAA-MM-DD: " BOOKDAY
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "insert into Reservas (Tipo_de_Habitacion, Nombre, Cantidad_de_mascotas, Dia_de_la_reserva) values ('$ROOM_KIND', '$NAME_BOOK', $PETS, '$BOOKDAY')"
			exit
		fi
		if [ "$opt" = "MODIFICAR" ]; then
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "select * from Reservas where Dia_de_la_reserva >= curdate();"
			read -p "Ingrese la columna que quiere modificar: " COLUMN
			read -p "Ingrese el dato correcto: " COLUMN_INFO
			read -p "Ingrese ID de la reserva: " ID
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "update Reservas set $COLUMN = '$COLUMN_INFO' where ID = '$ID' "
			exit
		fi
		if [ "$opt" = CONSULTAR ]; then
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD  -e "use Hotel;" -e "select * from Reservas where Dia_de_la_reserva = curdate();"
			exit
		fi
		done
	fi
	if [ "$opt" = "TRASLADOS" ]; then
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD  -e "use Hotel;" -e "select * from Traslados;"
		exit
	fi
	exit
	
	done


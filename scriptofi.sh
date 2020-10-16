#!/bin/bash
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
			crear_reserva=$(mysql -h localhost -u fakearch -p --database Hotel  -e "insert into Reservas (Tipo_de_Habitacion, Nombre, Cantidad_de_mascotas, Dia_de_la_reserva) values ('$ROOM_KIND', '$NAME_BOOK', $PETS, '$BOOKDAY')")
			exit
		fi
		if [ "$opt" = "MODIFICAR" ]; then
          modificar_reserva=$(mysql -h localhost -u fakearch -p --database Hotel -e "select * from Reservas where Dia_de_la_reserva >= curdate();")
			read -p "Ingrese la columna que quiere modificar: " COLUMN
			read -p "Ingrese el dato correcto: " COLUMN_INFO
			read -p "Ingrese ID de la reserva: " ID
			modificar_reserva=$(mysql -h localhost -u fakearch -p --database Hotel -e "update Reservas set $COLUMN = '$COLUMN_INFO' where ID = '$ID' ")
			exit
		fi
		if [ "$opt" = CONSULTAR ]; then
			consultar_reserva=$(mysql -h localhost -u fakearch -p --database Hotel -e "select * from Reservas where Dia_de_la_reserva = curdate();")
			exit
		fi
		done
	fi
	if [ "$opt" = "TRASLADOS" ]; then
			traslados_consultas=$(mysql -h localhost -u fakearch -p --database Hotel -e "select * from Traslados;")
		exit
	fi
	exit
	
	done


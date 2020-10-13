#!/bin/bash
OPCIONES="RESERVAS TRASLADOS HABITACIONES"
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
		ACCION="VER-TRASLADOS MODIFICAR-HORARIOS"
		select opt in $ACCION; do
			if [ "$opt" = "VER-TRASLADOS" ]; then 
				read -p "Ingrese usuario: " DB_USER
				read -sp "Ingrese password: " DB_USER_PSSWD
				read -p "Ingrese host: " DB_HOST
				mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD  -e "use Hotel;" -e "select * from Traslados;"
				exit
			fi
			if [ "$opt" = "MODIFICAR-HORARIOS" ]; then
				read -p "Ingrese usuario: " DB_USER
				read -sp "Ingrese password: " DB_USER_PSSWD
				read -p "Ingrese host: " DB_HOST
					ACCION2="HORARIOS-TRASLADOS ELIMINAR-TRASLADO"
						select opt in $ACCION2; do
							if [ "$opt" = "HORARIOS-TRASLADOS" ]; then
								read -p "Ingrese el nuevo horario en formato HH:MM:SS: " BEGIN_TIME
								read -p "Ingrese el ID que corresponde al traslado: " ID
								mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "update Traslados set Horarios_traslados = '$BEGIN_TIME' where ID = '$ID'"
								exit
							fi
							if [ "$opt" = "ELIMINAR-TRASLADO" ]; then 
								read -p "Ingrese ID que corresponda al traslado a eliminar: " ID
								echo "Los datos no se podran recuperar"
								read -p "Seguro que desea eliminar? y/n " CONFIRM		
								if [ "$CONFIRM" = "y" ]; then
									mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "delete from Traslados where ID = '$ID' "	
									echo "Se ha eliminado correctamente"
								exit
								fi
								if [ "$CONFIRM" = "n" ]; then
									echo "Accion cancelada"
								exit
								fi						
											
						

														 		
							exit
							fi
						done
				mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "update Traslados set $COLUMN = '$COLUMN_INFO' where Nombre = '$NAME_BOOK' "

			fi
			exit
		done
	fi
	if [ "$opt" = "HABITACIONES" ]; then 
		read -p "Ingrese usuario: " DB_USER
		read -sp "Ingrese password: " DB_USER_PSSWD
		read -p "Ingrese host: " DB_HOST
		read -p "Ingrese que tipo de habitacion quiere modificar" ROOM_KIND
		read -p "Ingrese para que cantidad de mascotas aplica el cambio de precio (ingrese numero)" PETS
		read -p "Ingrese nuevo precio" PRICE
		mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "update Habitaciones set Precio_por_dia_$ = $PRICE where Tipo_de_Habitacion = '$ROOM_KIND' and Cantidad_de_mascotas = $PETS"
		
	fi
	exit
	
	done















#!/bin/bash
			read -p "Ingrese usuario: " DB_USER
			read -sp "Ingrese password: " DB_USER_PSSWD
			read -p "Ingrese host: " DB_HOST

OPCIONES="RESERVAS TRASLADOS HABITACIONES"
	select opt in $OPCIONES; do
	if [ "$opt" = "RESERVAS" ]; then
		ACCION="INGRESAR MODIFICAR CONSULTAR"
		select opt in $ACCION; do
		if [ "$opt" = "INGRESAR" ]; then
			read -p "Ingrese tipo de habitacion: " ROOM_KIND
			read -p "Ingrese nombre del solicitante: " NAME_BOOK
			read -p "Ingrese cantidad de mascotas: " PETS
			read -p "Ingrese año de la reserva: " BOOK_YEAR
			read -p "Ingrese mes de la reserva: " BOOK_MONTH
			read -p "Ingrese día de la reserva: " BOOK_DAY
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "insert into Reservas (Tipo_de_Habitacion, Nombre, Cantidad_de_mascotas, Dia_de_la_reserva) values ('$ROOM_KIND', '$NAME_BOOK', $PETS, '$BOOK_YEAR-$BOOK_MONTH-$BOOK_DAY');"
			exit
		fi
		if [ "$opt" = "MODIFICAR" ]; then
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "select * from Reservas;"
			read -p "Ingrese la columna que quiere modificar: " COLUMN
			read -p "Ingrese el dato correcto: " COLUMN_INFO
			read -p "Ingrese ID de la reserva: " ID
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "update Reservas set $COLUMN = '$COLUMN_INFO' where ID = '$ID' "
		exit       
		fi
		if [ "$opt" = CONSULTAR ]; then
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD  -e "use Hotel;" -e "select * from Reservas;"
			exit
		fi
		done
	fi
	if [ "$opt" = "TRASLADOS" ]; then
		ACCION="VER-TRASLADOS MODIFICAR-HORARIOS"
		select opt in $ACCION; do
			if [ "$opt" = "VER-TRASLADOS" ]; then 
				mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD  -e "use Hotel;" -e "select * from Traslados;"
				exit
			fi
			if [ "$opt" = "MODIFICAR-HORARIOS" ]; then
					ACCION2="HORARIOS-TRASLADOS ELIMINAR-TRASLADO"
						select opt in $ACCION2; do
							if [ "$opt" = "HORARIOS-TRASLADOS" ]; then
								echo "Ingrese el nuevo horario: " 
								read -p "Ingrese la hora: " TIME_HOURS
								read -p "Ingrese los minutos: " TIME_MINUTES
								read -p "Ingrese los segundos: " TIME_SECONDS
								read -p "Ingrese el ID que corresponde al traslado: " ID
								mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "update Traslados set Horarios_traslados = '$TIME_HOURS:$TIME_MINUTES:$TIME_SECONDS' where ID = '$ID'"
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
		mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "select * from Habitaciones;"
		read -p "Ingrese el ID para el que aplicará el cambio de precio (solo un ID posible por accion): " ID
		read -p "Ingrese nuevo precio: " PRICE
		mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD -e "use Hotel;" -e "update Habitaciones set Precio_por_dia_$ = $PRICE where ID = $ID"
		
	fi
	exit
	
	done














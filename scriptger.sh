#!/bin/bash
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
				ingresar_reserva=$(mysql -h localhost -u fakearch -p --database Hotel -e "insert into Reservas (Tipo_de_Habitacion, Nombre, Cantidad_de_mascotas, Dia_de_la_reserva) values ('$ROOM_KIND', '$NAME_BOOK', $PETS, '$BOOK_YEAR-$BOOK_MONTH-$BOOK_DAY');")
				exit
			fi
			if [ "$opt" = "MODIFICAR" ]; then
				
				read -p "Ingrese la columna que quiere modificar: " COLUMN
				read -p "Ingrese el dato correcto: " COLUMN_INFO
				read -p "Ingrese ID de la reserva: " ID
				modificar_reserva=$(mysql -h localhost -u fakearch -p --database Hotel -e "update Reservas set $COLUMN = '$COLUMN_INFO' where ID = '$ID' ")
				exit       
			fi
			if [ "$opt" = CONSULTAR ]; then
					ACCIONES="CONSULTAR-HOY CONSULTAR-TODO"
					select opt in $ACCIONES; do
						if [ "$opt" = "CONSULTAR-HOY" ]; then
							consultar_hoy_reserva=$(mysql -h localhost -u fakearch -p --database Hotel -e "select * from Reservas where Dia_de_la_reserva = curdate();")
							exit
						fi
						if [ "$opt" = "CONSULTAR-TODO" ]; then 
								consultar_todo_reserva=$(_mysql -h localhost -u fakearch -p --database Hotel -e "select * from Reservas;")
								exit
						fi
			done
			exit
		fi
	done
	exit
	fi
		if [ "$opt" = "TRASLADOS" ]; then
			ACCION="VER-TRASLADOS MODIFICAR-HORARIOS"
			select opt in $ACCION; do
				if [ "$opt" = "VER-TRASLADOS" ]; then 
						ver_traslados=$(mysql -h localhost -u fakearch -p --database Hotel -e "select * from Traslados;")
						exit
				fi
				if [ "$opt" = "MODIFICAR-HORARIOS" ]; then
						ACCION2="HORARIOS-TRASLADOS ELIMINAR-TRASLADO"
						select opt in $ACCION2; do
							if [ "$opt" = "HORARIOS-TRASLADOS" ]; then
									echo "Turnos posibles 1er_Turno_inicio, 1er_Turno_fin, 2do_Turno_inicio, 2do_Turno_fin, 3er_Turno_inicio, 3er_Turno_fin"
									read -p "Ingrese para que turno aplicara el cambio: " TURNO
									echo "Ingrese el nuevo horario " 	
									read -p "Ingrese la hora: " TIME_HOURS
									read -p "Ingrese los minutos: " TIME_MINUTES
									read -p "Ingrese los segundos: " TIME_SECONDS
									read -p "Ingrese el dia para el que aplicará el cambio: " DAY
									horario_traslado=$(mysql -h localhost -u fakearch -p --database Hotel -e "update Traslados set $TURNO = '$TIME_HOURS:$TIME_MINUTES:$TIME_SECONDS' where Días = '$DAY'")
									exit
							fi
							if [ "$opt" = "ELIMINAR-TRASLADO" ]; then 
									read -p "Ingrese dia que corresponda al traslado a eliminar: " DAY
									echo "Los datos no se podran recuperar"
									read -p "Seguro que desea eliminar? y/n " CONFIRM		
									if [ "$CONFIRM" = "y" ]; then
										eliminar_traslados=$(mysql -h localhost -u fakearch -p -e "delete from Traslados where Días = '$DAY' "	)
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
				exit
				fi
		done
		exit
	fi
	if [ "$opt" = "HABITACIONES" ]; then
		read -p "Ingrese el ID para el que aplicará el cambio de precio (solo un ID posible por accion): " ID
		read -p "Ingrese nuevo precio: " PRICE
		habitaciones=$(mysql -h localhost -u fakearch -p -e "update Habitaciones set Precio_por_dia_USD$ = $PRICE where ID = $ID")
		exit	
	fi
	done

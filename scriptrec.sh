#!/bin/bash
		read -p "Ingrese usuario: " DB_USER
		read -sp "Ingrese password: " DB_USER_PSSWD
		read -p "Ingrese host: " DB_HOST
		OPCIONES="RESERVAS TRASLADOS SALIR"
		select opt in $OPCIONES; do

		if [ "$opt" = "RESERVAS" ]; then
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD  -e "use Hotel;" -e "select * from Reservas where Dia_de_la_reserva = curdate();" 
			exit
		fi
		if [ "$opt" = "TRASLADOS" ]; then
			mysql -h $DB_HOST -u $DB_USER -p$DB_USER_PSSWD  -e "use Hotel;" -e "select * from Traslados_clientes where Fecha = curdate();"
			exit	
		fi
		if [ "$opt" = "SALIR" ]; then 
			exit
		fi
	done

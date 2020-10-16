#!/bin/bash
 
		OPCIONES="RESERVAS TRASLADOS SALIR"
		select opt in $OPCIONES; do

		if [ "$opt" = "RESERVAS" ]; then
		  reservas=$(mysql -h localhost -u fakearch -p --database Hotel -e "select * from Reservas where Dia_de_la_reserva = curdate();")
		  exit
		fi
		if [ "$opt" = "TRASLADOS" ]; then
			traslados=$(mysql -h localhost -u fakearch -p --database Hotel -e "select * from Traslados_clientes where Fecha = curdate();")
			exit	
		fi
		if [ "$opt" = "SALIR" ]; then 
			exit
		fi
	done

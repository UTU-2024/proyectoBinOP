#!/bin/bash
OPCIONES="SO DB APP BKP"
select opt in $OPCIONES; do 
	if [ "$opt" = "SO" ]; then 
		echo "Ejecutando primer Script..."
			ACCION="ADD DEL"
			select opt in $ACCION; do
				if [ "$opt" = "ADD" ]; then
							if [ -z "$1" ]; then
 	            			     echo "Uso: $0 + nombre de usuario a agregar"
    	            			 echo "Luego, vuelva a seleccionar la opcion SO y seguido la opcion ADD"
								 echo "IMPORTANTE: SI $0 no funciona puede que no tenga los permisos necesarios, se recomienda ejecutar con el comando 'sudo'"
        	          			 exit
        			     	fi
								USER=$1
								useradd $USER
								exit
				fi
				if [ "$opt" = "DEL" ]; then
					if [ -z "$1" ]; then
						echo "Uso: $0 + nombre de usuario a eliminar"
						echo "Luego, vuelva a seleccionar la opcion SO y seguido la opcion DEL"
						exit
					fi
					USER=$1
					userdel $USER
					exit
				fi
			done
		exit
	fi
	if [ "$opt" = "DB" ]; then
		ACCION="CREATE-USER DELETE-USER"
		select opt in $ACCION; do
			if [ "$opt" = "CREATE-USER" ]; then
				if [ -z "$5" ]; then
					echo "Faltan parametros"
					echo "Uso: $0 + mysqluser-con-el-que-ingresamos-a-DB mysqluser-host useradd useradd-host useradd-password"
				exit
				fi
				echo "Creating user..."
				SQLHOST=$1
				SQLUSER=$2
				USERADD=$3
				HOSTUSERADD=$4
				PASWDUSERADD=$5
				echo "Ingrese password para $SQLUSER"
				mysql -h $SQLHOST -u $SQLUSER -p -e "create user '$USERADD'@'$HOSTUSERADD' identified by '$PASWDUSERADD';"
				echo "User added."
				exit
			fi
			if [ "$opt" = "DELETE-USER" ]; then
				if [ -z $3 ]; then
					echo "Faltan parametros"
					echo "Uso: $0 + mysqluser-con-el-que-ingresamos-a-DB mysqluser-host userdel"
				exit
				fi
				echo Deleting user...
				SQLHOST=$1
				SQLUSER=$2
				USERDEL=$3
				echo "Ingrese password para $SQLUSER"
				mysql -h $SQLHOST -u $SQLUSER -p -e "delete from mysql.user where user = '$USERDEL';"
			echo "User deleted."
			exit
			fi
		done
	fi
done





















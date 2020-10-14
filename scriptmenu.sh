#!/bin/bash
OPCIONES="SO DB APP BKP"
select opt in $OPCIONES; do 
	if [ "$opt" = "SO" ]; then 
		echo "Ejecutando primer Script..."
			ACCION="AGREGAR ELIMINAR MODIFICAR"
			select opt in $ACCION; do
				if [ "$opt" = "AGREGAR" ]; then
					echo "El nombre de usuario debe ser escrito en minuscula"
					read -p "Ingrese el nombre de usuario a agregar: " USER
					sudo adduser $USER
					exit
				fi
				if [ "$opt" = "ELIMINAR" ]; then
					echo "El nombre de usuario debe de ser escrito en minuscula"
					read -p "Ingrese el nombre de usuario a eliminar: " USER
					sudo userdel $USER
					exit
				fi
				if [ "$opt" = "MODIFICAR" ]; then 
					ACCION="NOMBRE-USUARIO PASSWORD-USUARIO"
					select opt in $ACCION; do
						if [ "$opt" = "NOMBRE-USUARIO" ];then 
							read -p "Ingrese nombre de usuario anterior: " OLD_NAME
							read -p "Ingrese nuevo nombre de usuario: " NEW_NAME
							sudo usermod -l $NEW_NAME $OLD_NAME
							echo "$OLD_NAME now is $NEW_NAME"
						exit
						fi
						if [ "$opt" = "PASSWORD-USUARIO" ]; then
							read -p "Ingrese nombre del usuario para cambiar password: " USER
							sudo passwd $USER
						exit
						fi
					done
				exit
				fi
			done
		exit
	fi
	if [ "$opt" = "DB" ]; then
		ACCION="CREATE-USER DELETE-USER MODIFY-USER"
		select opt in $ACCION; do
			if [ "$opt" = "CREATE-USER" ]; then
				read -p "Ingrese el host (DBA) desde el cual se esta comunicando: " DBA_HOST
				read -p "Ingrese el nombre de usuario DBA: " DBA_USER
				read -sp "Ingrese password DBA: " DBA_PSSWD
				echo "Creating user..."
				read -p "Ingrese nombre de usuario a agregar: " USER_ADD
				read -p "Ingrese host del usuario a agregar: " USER_ADD_HOST
				read -sp "Ingrese password del usuario a agregar: " USER_ADD_PSSWD
				mysql -h $DBA_HOST -u $DBA_USER -p$DBA_PSSWD -e "create user '$USER_ADD'@'$USER_ADD_HOST' identified by '$USER_ADD_PASSWD';"
				echo "User added."
				exit
			fi
			if [ "$opt" = "DELETE-USER" ]; then
				read -p "Ingrese el host (DBA) desde el cual se esta comunicando: " DBA_HOST
				read -p "Ingrese el nombre de usuario DBA: " DBA_USER
				read -sp "Ingrese password DBA: " DBA_PSSWD
				echo "Deleting user..."
				read -p "Ingrese nombre de usuario a eliminar: " USER_DEL
				read -p "Ingrese host del usuario a eliminar: " USER_DEL_HOST
				mysql -h $DBA_HOST -u $DBA_USER -p$DBA_PSSWD -e "drop user '$USER_DEL'@'$USER_DEL_HOST';"
				echo "User deleted."
				exit
			fi
			if [ "$opt" = "MODIFY-USER" ]; then
				ACCION="USER-NAME USER-PASSWORD"
				select opt in $ACCION; do
				if [ "$opt" = "USER-NAME" ]; then 
					read -p "Ingrese el host (DBA) desde el cual se esta comunicando: " DBA_HOST
					read -p "Ingrese el nombre de usuario DBA: " DBA_USER
					read -sp "Ingrese password DBA: " DBA_PSSWD
					read -p "Ingrese nombre anterior del usuario: " OLD_USER
					read -p "Ingrese nuevo nombre para el usuario: " NEW_USER
					 mysql -h $DBA_HOST -u $DBA_USER -p$DBA_PSSWD -e "use mysql;" -e "update user set user='$NEW_USER' where user='$OLD_USER';"
					 mysql -h $DBA_HOST -u $DBA_USER -p$DBA_PSSWD -e "flush privileges;"
					echo "Changing user name..."	
					echo "Name changed."	
					exit
				fi
				if [ "$opt" = "USER-PASSWORD" ]; then
						read -p "Ingrese el host (DBA) desde el cual se esta comunicando: " DBA_HOST
						read -p "Ingrese el nombre de usuario DBA: " DBA_USER
						read -sp "Ingrese password DBA: " DBA_PSSWD
						read -p "Ingrese nombre de usuario a modificar: " USER
						read -sp "Ingrese nuevo password para el usuario a modificar: " PSSWD
						mysql -h $DBA_HOST -u $DBA_USER -p$DBA_PSSWD -e "use mysql;" -e "update user set password=PASSWORD('$PSSWD') where user='$USER';"
						mysql -h $DBA_HOST -u $DBA_USER -p$DBA_PSSWD -e "flush privileges;"
						echo "Changing password..."	
						echo "Password changed."
						exit
				fi
				done
			exit
			fi
		done
	fi
	if [ "$opt" = "APP" ]; then
		ACCION="RESERVAS TRASLADOS"
		select opt in $ACCION; do
				read -p "Ingrese host desde el cual se esta comunicando: " HOST
				read -p "Ingrese el usuario con el cual se conectara a la base de datos: " USER
				read -sp "Ingrese el password para el usuario: " PSSWD
			
			if [ "$opt" = "RESERVAS" ]; then
				echo "Entrando en Reservas..."
				mysql -h $HOST -u $USER -p$PSSWD -e "use Hotel;" -e "select * from Reservas;"
				exit
			fi
			if [ "$opt" = "TRASLADOS" ]; then
					echo "Entrando en traslados..."
					mysql -h $HOST -u $USER -p$PSSWD -e "use Hotel;" -e "select * from Traslados"
				exit
			fi
		done
	exit
	fi
	if [ "$opt" = "BKP" ]; then
		read -p "Ingrese el nombre de usuario DBA: " DBA_USER
		read -sp "Ingrese password DBA: " DBA_PSSWD
	 	mysqldump -u $DBA_USER -p$DBA_PSSWD Hotel | gzip -c > /home/fakearch/proyecto2020/backup_hotel/hotel.`date +%F`.sql.gz
		echo "Creating backup..."	
		echo "Backup created."
		exit
	fi
done





















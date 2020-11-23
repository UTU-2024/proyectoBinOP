mysql -u dba -pdba2020 --database Hotel -NB -e "select Reservas.ID, Reservas.Tipo_de_Habitacion, Reservas.Nombre, Reservas.Cantidad_de_mascotas, Reservas.Dia_de_la_reserva from Reservas where Dia_de_la_reserva = curdate();" 



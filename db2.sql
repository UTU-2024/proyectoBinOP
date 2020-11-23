mysql -u dba -pdba2020 --database Hotel -NB -e "select Traslados_clientes.ID, Traslados_clientes.Cantidad_de_mascotas, Traslados_clientes.Horarios_traslados, Traslados_clientes.Tiempo_del_recorrido, Traslados_clientes.Destino, Traslados_clientes.Fecha from Traslados_clientes where Fecha = curdate();" 



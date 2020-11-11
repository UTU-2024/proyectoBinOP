#!/bin/bash 
echo "Tipo de contenido: texto/html"
eco ""
nombre = 'echo "$ QUERY_STRING" | awk '{split ($ 0, array, "&")} END
{print array [1]'} | awk ' {split ($ 0, array, "=")} END
	{print array [2]}'

		email = 'echo "$ QUERY_STRING" | awk '{split ($ 0, array, "& amp;")} END {print array [2]}' | awk '{split ($ 0, array, "=")} END {print array [2]}' | sed -e 's /% 40 / @ / g' 
		
#echo "<h1> ¡Bienvenido" $ name "! </h1>"
#echo "<h2> Su dirección de correo electrónico es" $ email
gato <<EOT

<! DOCTYPE html>
<html>
<cabeza>
	<title> Bienvenido a nuestra página web </title>
</head>
<cuerpo>
	<h1> Bienvenido, $ nombre </h1>
	<h2> Su dirección de correo electrónico es & email </h2>
</body>
</html>

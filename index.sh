#! /bin/bash
echo "Tipo de contenido: texto/html"eco""gato<<EOT
<!DOCTYPE html>
<html>
<cabeza>
	<title> Bienvenido a nuestra página web </title>
</head>
<cuerpo>
	<p> ¡Hola! Ingrese su nombre y dirección de correo electrónico y presione el botón Enviar </p>
	<from action = "submit.sh" method = "get">
		<label> Nombre </label>
		<input type= "text" name="Ana">
<br>
		<label>correo electrónico </label>
		<input type="text" name = "ana20@gmail.com">
<br>
		<button type ="enviar">Enviar </button>
	</from>
</body>
</html>
EOT


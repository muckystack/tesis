<?php // Script de conexion a la Base de Datos

	$servidor="localhost"; // Nombre o direccion del servidor
	$usuario="root"; // Tipo de usuario
	$clave=""; // Contraseña o clave de usuario
	$baseDeDatos="verduras_y_frutas"; // Nombre de la base de datos

	// Enlace de conexion
		$conexion = mysqli_connect($servidor, $usuario, $clave, $baseDeDatos);

	if(!$conexion){
		echo"Error en la conexion con el servidor";
	}
	echo"conexión establecida con el servidor";
?>
<?php

  include('conexionGeneral.php');
/*
if (isset($ _POST['submit'])) { // SI EXISTE LOS CAMPOS
  // ae toman los id de cada input (campo)
  $Nombre = $ _POST['#nombre'];
  $Apellido = $ _POST['#apellido'];
  $Telefono = $ _POST['T#telefono'];
  $Password = sha1($ _POST['#password']); //  encripta los datos al eviarlos
  $Rol = $ _POST['#rol'];
  $Salary = $ _POST['#salario'];

	$query = "INSERT INTO usuarios(`nombre`, `apellido`, `telefono`, `password`, `rol`, `pago_semanal`) VALUES(
								  '$Nombre',
								  '$Apellido',
								  '$Telefono',
								  '$Password',
								  '$Rol',
								   $Salary
	)";

	$result = mysqli_query($connection, $query);
	
	if (!$result) {
	  die('El usuario no pudo se pudo agregar');
	}			
  echo 'Usuario Agregado Exitosamente!!!';
}
*/

	contraseña autocrementable
		$Nombre  =$_POST["nombre"];
		$Apellido=$_POST["apellido"];
		$Telefono=$_POST["telefono"];
		$Password=sha1$_POST["password"]; // sha1 encripta los datos al eviarlos
		$Rol	 =$_POST["rol"];
		$Salario =$_POST["salario"];

		$insertarDatos $insertarDatos = "INSERT INTO usuarios (nombre, apellido, telefono, password, rol, pago_semanal) VALUES(	
														'$Nombre',
														'$Apellido',
														'$Telefono',
														'$Password',
														'$Rol',
														 $Salario)";
if ($insertarDatos == true) {
	alert("Agregado con exito");
}else{
	alert("Fallo al agregar Usuario");
}
		//echo mysql_query($conexion, $sql); //arroja los valosres si 1 se conecto y 0 si NO se conecto

?>
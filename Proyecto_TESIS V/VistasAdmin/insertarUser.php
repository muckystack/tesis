<?php
	include('conexionGeneral.php');

	if (isset($_POST['Nombre'])) { // SI EXISTE LOS CAMPOS
		// ae toman los id de cada input (campo)
		$Nombre = $_POST['Nombre'];
		$Apellido = $_POST['Apellido'];
		$Telefono = $_POST['Telefono'];
		$Password = sha1($_POST["Password"]); //  encripta los datos al eviarlos
		$Rol = $_POST['Rol'];
		$Salary = $_POST['Salario'];

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
			
		alert('Usuario Agregado Exitosamente!!!');
	}


	/*contraseña autocrementable
		$Nombre  =$_POST["Nombre"];
		$Apellido=$_POST["Apellido"];
		$Telefono=$_POST["Telefono"];
		$Password=sha1$_POST["Password"]; // sha1 encripta los datos al eviarlos
		$Rol	 =$_POST["Rol"];
		$Salario =$_POST["Salario"];

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
*/
?>
<?php
	include('conexionGeneral.php');

if(isset($_POST['id'])) {

	$id = $_POST['id'];

	$nombre = $_POST['nombre'];
	$apellido = $_POST['apellido'];
	$telefono = $_POST['telefono'];
	$pasword = $_POST['password'];
	$rol = $_POST['rol'];
	$salario = $_POST['salario'];

	$query = "UPDATE `usuarios` SET nombre = '$nombre', 
									apellido = '$apellido', 
									telefono = '$telefono', 
									password = '$password', 
									rol = '$rol', 
									pago_semanal = '$salario' 
	WHERE Id_Usuario ='$id'";
/*
	"UPDATE `usuarios` SET `nombre`=$nombre, `apellido`=$apellido, `telefono`=$telefono, `password`=$password, `rol`=$rol, `pago_semanal`=salario WHERE `Id_Usuario` ='$id'";
*/
	// se ejecuta
	$result = mysqli_query($conetion, $query);
	
	if (!$result) {
		die('Actualización fallida');
	}
	alert('Registro Actualizado Correctamente');
}
?>
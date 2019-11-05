<?php
	include('conexionGeneral.php');

$search = $_POST['search']; //VARIABLE RECIBIDA de aplicacion.js

if(!empty($search)) {
	
	// realiza la consulta en la tabla usuarios y que concuerde con el nombre de toda la cadena
	$query = "SELECT * FROM usuarios WHERE nombre LIKE '$search%'";
  
  $result = mysqli_query($connection, $query);// se recibe los resultados
  
  if(!$result) {
    die('Error de consulta' . mysqli_error($connection));
  }


  $json = array();
		while ($row = mysqli_fetch_array($result) ) {
			$json[] = array(
				'Id' => $row['Id_Usuario'],
				'nombre' => $row['nombre'],
				'apellido' => $row['apellido'],
				'telefono' => $row['telefono'],
				'password' => $row['password'],
				'rol' => $row['rol'],
				'salario' => $row['pago_semanal']
			);
		}
		//se convierte a un valor a cadena
		$jsonstring = json_encode($json);
		echo $jsonstring;
  }
?>
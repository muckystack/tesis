<?php 
	$servidor="localhost"; // Nombre o direccion del servidor
	$usuario="root"; // Tipo de usuario
	$clave=""; // Contraseña o clave de usuario
	$baseDeDatos="verduras_y_frutas"; // Nombre de la base de datos

	// Enlace de conexion
		$connection = mysqli_connect($servidor, $usuario, $clave, $baseDeDatos);

		//mysqli_set_charset($connection, "utf8");
//test de connection
//	if(!$connection){
//		echo"Error en la conexion con el servidor";
//	}
//	echo"conexión establecida con el servidor";

////////////////////	Conexion a la base de DATOS		/////////////////////////////

if (isset($_POST['btnSaveGasto'])) { // si se preciona el boton Guardar proveedor has lo siguiente

		/* se pasan los name del formulario para obtener 
	   los datos en las variables $names */
GastoFecha
// INGRESO DE DATOS EN TABLA Proveedor
	$			= $_POST['GastoFecha'];
	$GastoExtra			= $_POST['GastoExtra'];
	$GastoDescripción 	= $_POST['GastoDescripción'];
	$GastoTotal		= $_POST['GastoTotal'];

/////////////////	Inserccion de la primer tabla AdministraciondeGastos 	///////////////////
	$gastoAdmin = $connection->query("
		INSERT INTO `administracion_de_gastos`(`cantidad`, 
											   `descripcion_gastos`, 
											   `costos`
											  ) VALUES ('$GastoExtra',
											  			'$GastoDescripción',
											  			'$GastoTotal'
													   )");
	if ($gastoAdmin==true) {
		// inserccion en la tabla gasto adicional
		$gastoAdicional = $connection->query("
			INSERT INTO `gastos_adicionales`(`fecha_de_realizacion`) 
			VALUES ('$GastoFecha')"
		);
	}

	// mostrar mensaje de confirmacion
	confirm("gasto agregado");

	console.log("Gasto Adicional Exitoso");

}// FIN, si se preciona el boton guardar Gastos Adionales

 ?>
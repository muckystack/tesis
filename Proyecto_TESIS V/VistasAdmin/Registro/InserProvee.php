<?php 

	include('conexionGeneral.php');
	
////////////////////	Conexion a la base de DATOS		/////////////////////////////


if (isset($_POST['btnSaveProvee'])) { // si se preciona el boton Guardar proveedor has lo siguiente
		
	/* se pasan los name del formulario para obtener 
	   los datos en las variables $names */

// INGRESO DE DATOS EN TABLA Proveedor
	$NombreProveedor	= $_POST['NombreProveedor'];
	$TelefonoProveedor	= $_POST['TelefonoProveedor'];
	$RFCProveedor 		= $_POST['RFCProveedor'];
	$CiudadProveedor	= $_POST['CiudadProveedor'];
	$CorreoProveedor	= $_POST['CorreoProveedor'];
// INGRESO DE DATOS EN TABLA Compras
	$HoraCompra			= $_POST['HoraCompra'];
	$FechaCompra		= $_POST['FechaCompra'];
// INGRESO DE DATOS EN TABLA Detalle Compras
	$CostoUnidad		= $_POST['CostoUnidad'];
// INGRESO DE DATOS EN TABLA Producto
	$NombreProducto		= $_POST['NombreProducto'];
	$CostoAdquisición	= $_POST['CostoAdquisición'];
	$CostodeVenta		= $_POST['CostodeVenta'];
	$KilosComprados		= $_POST['KilosComprados'];
	$ListaTrueFalse		= $_POST['ListaTrueFalse'];

/////////////////	Inserccion de la primer tabla Proveedor 	///////////////////
	$Proveedor = $connection->query("
		INSERT INTO `proveedor`(`nombre_proveedor`, 
								`ciudad`, 
								`telefono`, 
								`RFC`, 
								`correo`) VALUES ('$NombreProveedor',
												  '$TelefonoProveedor',
												  '$RFCProveedor',
												  '$CiudadProveedor',
												  '$CorreoProveedor'
												 )");
	if ($Proveedor==true) { // si  la Query anterior se ejecuta con exito, ejecuta la siguiente insercción en la TABLA Proveedor
	$Compras = $connection->query("
		INSERT INTO `detalle_compras`(`costo_por_unidad`, 
									  `fecha_de_compra_de_producto`, 
									  `hora_de_compra`) VALUES ('$CostoUnidad'
									  							'$FechaCompra'
									  							'$HoraCompra',
												  			   )");
	}// FIN DE INSERPCION 2
	if ($Compras==true) { // si  la Query anterior se ejecuta con exito, ejecuta la siguiente insercción en la TABLA Compras
		$DetalleCompra = $connection->query("
			INSERT INTO `detalle_compras`(`costo_por_unidad`, 
										  `fecha_de_compra_de_producto`, 
										  `hora_de_compra`) VALUES ('$CostoUnidad'
										  							'$FechaCompra'
									  								'$HoraCompra'
										  						   )");
	}// FIN DE INSERPCION 3
	if ($DetalleCompra==true) { // si  la Query anterior se ejecuta con exito, ejecuta la siguiente insercción en la TABLA DetalleCompra
		$Producto = $connection->query("
			INSERT INTO `productos`(`nombre_producto`, 
									`precio_de_adquisicion`, 
									`precio_a_vender`, 
									`kilos_adquiridos`, 
									`habilitar_deshabilitar_producto`, 
								   ) VALUES('$NombreProducto',
											'$CostoAdquisición',
											'$CostodeVenta',
											'$KilosComprados',
											'$ListaTrueFalse'
										   )");
	}// FIN DE INSERPCION 4

		if ($DetalleCompra==true) { // si  la Query anterior se ejecuta con exito, ejecuta el siguiente mensaje
			alert("insercciones correctas!!! (*-*)");
		}//fin de mensaje de confirmación

}//fin de insercciones
 ?>
<?php 
	include('conexionGeneral.php');

	if (isset($_POST['id'])) {
		$id = $_POST['id'];

		$query = "DELETE FROM usuarios WHERE Id_Usuario = $id";

		$result = mysqli_query($connection, $query);

		if (!$result) {
			die('El registro no se pudo Eliminar');
		}
		echo "Registro eliminado Correctamente";
	}
 ?>
<?php 
	include('conexionGeneral.php');
		
// archivo de actualizar
if(isset($_POST['id'])) {

  $id = mysqli_real_escape_string($connection, $_POST['id']);

  $query = "SELECT * FROM usuarios WHERE Id_Usuario = $id";

  $result = mysqli_query($connection, $query);

  if(!result) {
    die('Query ha Fallado, no se puede actualizar '. mysqli_error($connection));
  }

  $json = array();
  while($row = mysqli_fetch_array($result)) {
    $json[] = array(
            'id' => $row['Id_Usuario'],
            'nombre' => $row['nombre'],
            'apellido' => $row['apellido'],
            'telefono' => $row['telefono'],
            'password' => $row['password'],
            'rol' => $row['rol'],
            'salario' => $row['pago_semanal']
        );
  }
  //se convierte a un valor a cadena
    $jsonstring = json_encode($json[0]);
    echo $jsonstring;

}


?>
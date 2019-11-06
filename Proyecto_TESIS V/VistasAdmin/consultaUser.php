<?php // php para crear lista de consultas y mostrar en tabla

// consulta a la base de datos
include('conexionGeneral.php');

mysqli_set_charset($connection, "utf8");
  
  $query = "SELECT * FROM usuarios";
  $result = mysqli_query($connection, $query);
  if(!$result) {
    die('Error de Consulta a la Base de Datos'. mysqli_error($connection));
  }

      $json = array();
    while($row = mysqli_fetch_array($result)) {
        $json[] = array(
            'id' => $row['Id_Usuario'],
            
            'Nombre' => $row['nombre'],
            'Apellido' => $row['apellido'],
            'Telefono' => $row['telefono'],
            'Password' => sha1($row['password']),
            'Rol' => $row['rol'],
            'Salario' => $row['pago_semanal']
        );
    }
    $jsonstring = json_encode($json);
    echo $jsonstring;
?>
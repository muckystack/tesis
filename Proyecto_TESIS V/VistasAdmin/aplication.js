$(document).ready(function() {
// Variable negada para comprobación de la actualización NO SE ESTA Editando registro
let edit = false;

console.log('JQuerty Funcionando');
obtenerDatos(); // EJECUTA LA funcion para obtemer datos automaticos

$('#resultsSearch').hide(); // Se oculta el contenedor cuando inicia
	
    // tipo de evento search key
	$('#search').keyup(function() { // INICIO al presionar el buscador ID="search"
		if($('#search').val()) { // SI el navbar contiene un valor..
		let search = $('#search').val();
			$.ajax({
			    url: 'BusquedaServer.php',
			    data: {search},
			    type: 'POST',
			    success: function (response) {
		    	console.log(response); // Muestra lo que recibe del php Backend

			        if(!response.error) {

			            let tasks = JSON.parse(response);
			            let template = ''; //platilla para rellenar

			            tasks.forEach(task => { //RECORRE LA TAREA (BUSQUEDA)
			            template += `
			                    <li>
			                     	<a href="#" class="task-item">
										${task.nombre}
									</a>
								</li>` 
			            });  // forEach
			            console.log(template);
						$('#resultsSearch').show();
			            $('#container').html(template);
			        }
        		} 
    
      		});
    	}
  	}); // buscador


//se realiza la consulta para obtener en la tabla al iniciar la app
	//function fetchTasks() {
function obtenerDatos(){
	//realiza la consulta de un Datos que esta agregado a la base de datos
	$.ajax({
		url: 'consultaUser.php',
		type: 'GET',
		success: function(response)	{
		    console.log(response); // Muestra lo que recibe del php Backend

		    //rellenar la tabla tbady con el id = "tasks"
		    const tasks = JSON.parse(response);
		    console.log(tasks);

		    let template = '';

		    //al primero se le agrega un attributo VerUserID al tr
			// Despues se agrega la clase="selecUdate" para la actualizar registro 
		    tasks.forEach(task => {
		    template += `
			   			<tr taskId="${task.id}">
							<td>${task.id}</td>
							<td>
								<a href="#" class="selecUpdate btn btn-outline-info">
									${task.Nombre}
								</a>
							</td>
								<td>${task.Apellido}</td>
								<td>${task.Telefono}</td>
								<td>${task.Password}</td>
								<td>${task.Rol}     </td>
								<td>${task.Salario} </td>
								<td>
									<button class="btnEliminar btn btn-danger">
										Eliminar
									</button>
							</td>
							</tr>
			`}); // forEach

			$('#tasks').html(template);
			console.log(template);
		} // success
	}); // ajax
}// FIN obtenerDatos()


	// Se crea la insercion de User a la tabla usuarios
	$('#formulario').submit(e => { 
	    e.preventDefault(); //metodo para envia la recarga y envia
	    console.log('cliqueado buscar');

	    
	    const postData = { // todo se guarda en un objeto
						id:	 	$('#taskId').val(), //variable para capturar el id
						name: 	$('#nombre').val(),
						Ape:  	$('#apellido').val(),
						Tel:  	$('#telefono').val(),
						Pass:  	$('#Password').val(),
						Rol:  	$('#rol').val(),
						Salary: $('#salario').val()
		} // objeto postData

	    //SI edit es Verdadero Envia los datos a InsertarUser y si es falso enviar a otra de direccion y Actualizar
		const url = edit === false ? 'insertarUser.php' : 'tarea_edit.php';
	    console.log(postData, url);

	    // $.post('url a donde lo va a enviar', objeto, function(respuesta del servidor) {});
	    $.post(url, postData, (response) => {
	      console.log(response);
	      $('#formulario').trigger('reset'); //RESETEA EL FORMULARIO
	       
	      obtenerDatos(); // cada vez que se agregue uno se actualizará la tabla de la derecha
	      //fetchTasks();
	    }); // $.post
	}); // FIN de la insercion de User a la tabla usuarios


	//Petición para actualizar unsuario mediante el id
	$(document).on('click', '.selecUpdate', (e) => {

		// se selecciona mediante el id, se busca de manera al elemento padre 
		const element = $(this)[0].activeElement.parentElement.parentElement;
    	const id = $(element).attr('taskId');

		console.log(id);

		$.post('actualizarUser.php', {id}, (response) => {
			console.log(response); // Muestra lo que recibe del php Backend

			const tasks = JSON.parse(response);

			$('#taskId').val(task.id);

			$('#nombre').val(task.nombre);
			$('#apellido').val(task.apellido);
			$('#telefono').val(task.telefono);
			$('#password').val(task.paswwor);
            $('#rol').val(task.rol);
            $('#salario').val(task.salario);

            //aqui cambia la variable edit a true
            edit = true;
		}); // $.post
		e.preventDefault();
	}); // actualizar click

	//se busca el boton eliminar a travez de la clase agregado por mi class="boton-Eliminar"
	$(document).on('click', 'btnEliminar', (e) => {
		console.log('cliqueado');

		if (confirm('¿Estas seguro de querer eliminar registro?')) { //condicion para confirmar eliminación del registro
			// se selecciona mediante el id, se busca de manera al elemento padre
			const element = $(this)[0].activeElement.parentElement.parentElement;
			
			// se selecciona solo un elemento
			const id = $(element).attr('taskId'); //busca el atributo  

			console.log(element);
			
			$.post('eliminaUser.php', {id}, (response) => {
				console.log(response);

				obtenerDatos(); //para que se actualice sin necesidad de recargar
			}) ; // $.post
		} // If confirm
	});// FIN DE LA PETICION ELIMINAR

}); // FIN DE FUNCION READY



//(funcion para formulario User´s)(){
    var formulario = document.getElementById('formulario'),
        Nombre = formulario.Nombre,
        Apellido = formulario.Apellido,
        Telefono = formulario.Telefono,
        Password = formulario.Password,
        Rol = formulario.Rol,
        Salario = formulario.Salario;
        error = document.getElementById('error');

function validarCampos(e){
    if(Nombre.value == '' || Apellido.value == '' || Telefono.value == '' || Rol.value == '' || Salario.value == ''){
        error.style.display = 'block';
        alert("Por Favor llena todos los CAMPOS!!!");
        e.preventDefault();
    }else{
        error.style.display='none';
    }
}

function validarForm(e){
   error.style.display = 'block';
   validarCampos(e);
}

formulario.addEventListener('submit', validarForm);

//}())
//(funcion para formProveedor / Gastos Adicionales)(){
    var formulario = document.getElementById('formulario'),
// INGRESO DE DATOS EN TABLA Proveedores
        Nombre = formulario.NombreProveedor,
        Telefono = formulario.TelefonoProveedor,
        RFCProveedor = formulario.RFCProveedor,
        CiudadProveedor = formulario.CiudadProveedor,
        CorreoProveedor = formulario.CorreoProveedor,

// INGRESO DE DATOS EN TABLA Detalle Compras
        HoraCompraProveedor = formulario.HoraCompra,
        FechaCompraProveedor = formulario.FechaCompra,
        
// INGRESO DE DATOS EN TABLA Detalle Compras
        CostoUnidad = formulario.CostoUnidad,

// INGRESO DE DATOS EN TABLA Producto
        NombreProducto = formulario.NombreProducto,
        CostoAdquisición = formulario.CostoAdquisición,
        CostodeVenta = formulario.CostodeVenta,
        KilosComprados = formulario.KilosComprados,
        ListaTrueFalse = formulario.ListaTrueFalse;

        error = document.getElementById('error');

function validarCamp(e){
    if(NombreProveedor.value == '' || CiudadProveedor.value == '' || TelefonoProveedor.value == '' || HoraCompra.value == '' || FechaCompra.value == '' || CostoUnidad.value == '' || NombreProducto.value == '' || CostoAdquisición.value == '' || CostodeVenta.value == '' || KilosComprados.value == '' || ListaTrueFalse.value == 'Habilitar' || ListaTrueFalse.value == 'Deshabilitar'){
        error.style.display = 'block';
        alert("Por Favor llena todos los CAMPOS!!!");
        e.preventDefault();

        if (!ListaTrueFalse.value == 'Habilitar' || ListaTrueFalse.value == 'Deshabilitar') {
            alert("Por Favor SOLO SELECCIONE UN VALOR DADO en el CAMPOS!!!");
        }
    }else{
        error.style.display='none';
    }
}

function validarFormProvee(e){
   error.style.display = 'block';
   validarCamp(e);
}

formulario.addEventListener('submit', validarFormProvee);

//}())
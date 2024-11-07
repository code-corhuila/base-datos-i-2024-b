$(document).ready(function () {
    loadData();
    loadClientes();
    loadServicios();
});

// Cargar datos de ServicioCliente en la tabla
function loadData() {
    $.ajax({
        url: 'http://localhost:9000/api/servicioCliente',
        method: 'GET',
        success: function (data) {
            let tableContent = '';
            data.forEach((item) => {
                tableContent += `
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.cantidad}</td>
                        <td>${item.totalPagar.toFixed(2)}</td>
                        <td>${item.clienteId ? item.clienteId.id : ''}</td>
                        <td>${item.servicioId ? item.servicioId.id : ''}</td>
                        <td>
                            <button class="btn btn-info btn-sm" onclick="editRecord(${item.id})">Editar</button>
                            <button class="btn btn-danger btn-sm" onclick="deleteRecord(${item.id})">Eliminar</button>
                        </td>
                    </tr>`;
            });
            $('#dataBody').html(tableContent);
        },
        error: function (error) {
            console.error('Error al cargar datos', error);
        }
    });
}

// Cargar lista de clientes para el campo select
function loadClientes() {
    $.ajax({
        url: 'http://localhost:9000/api/cliente',
        method: 'GET',
        success: function (data) {
            let options = '<option value="">Seleccione un cliente</option>';
            data.forEach((cliente) => {
                options += `<option value="${cliente.id}">${cliente.nombre}</option>`;
            });
            $('#clienteId').html(options);
        },
        error: function (error) {
            console.error('Error al cargar clientes', error);
        }
    });
}

// Cargar lista de servicios para el campo select
function loadServicios() {
    $.ajax({
        url: 'http://localhost:9000/api/servicio',
        method: 'GET',
        success: function (data) {
            let options = '<option value="">Seleccione un servicio</option>';
            data.forEach((servicio) => {
                options += `<option value="${servicio.id}">${servicio.nombre}</option>`;
            });
            $('#servicioId').html(options);
        },
        error: function (error) {
            console.error('Error al cargar servicios', error);
        }
    });
}

function createOrUpdate() {
    const id = $('#id').val();
    const data = {
        cantidad: parseInt($('#cantidad').val()),
        totalPagar: parseFloat($('#totalPagar').val()),
        clienteId: { id: parseInt($('#clienteId').val()) },
        servicioId: { id: parseInt($('#servicioId').val()) }
    };

    const url = id ? `http://localhost:9000/api/servicioCliente/${id}` : 'http://localhost:9000/api/servicioCliente';
    const method = id ? 'PUT' : 'POST';

    $.ajax({
        url: url,
        method: method,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function () {
            resetForm();
            loadData();
            alert(id ? 'Servicio Cliente actualizado con éxito' : 'Servicio Cliente creado con éxito');
        },
        error: function (error) {
            console.error('Error al guardar datos', error);
        }
    });
}

// Editar registro
function editRecord(id) {
    $.ajax({
        url: `http://localhost:9000/api/servicioCliente/${id}`,
        method: 'GET',
        success: function (data) {
            $('#id').val(data.id);
            $('#cantidad').val(data.cantidad);
            $('#totalPagar').val(data.totalPagar);
            $('#clienteId').val(data.clienteId ? data.clienteId.id : '');
            $('#servicioId').val(data.servicioId ? data.servicioId.id : '');
            $('#submitButton').text('Actualizar');
        },
        error: function (error) {
            console.error('Error al obtener el registro', error);
        }
    });
}

function resetForm() {
    $('#id').val('');
    $('#cantidad').val('');
    $('#totalPagar').val('');
    $('#clienteId').val('');
    $('#servicioId').val('');
    $('#submitButton').text('Guardar');
}

// Eliminar registro
function deleteRecord(id) {
    if (confirm('¿Estás seguro de eliminar este registro de servicio cliente?')) {
        $.ajax({
            url: `http://localhost:9000/api/servicioCliente/${id}`,
            method: 'DELETE',
            success: function () {
                loadData();
                alert('Servicio Cliente eliminado con éxito');
            },
            error: function (error) {
                console.error('Error al eliminar registro', error);
            }
        });
    }
}

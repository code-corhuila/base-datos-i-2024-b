$(document).ready(function () {
    loadData();
});

// Cargar datos en la tabla
function loadData() {
    $.ajax({
        url: 'http://localhost:9000/api/cliente',
        method: 'GET',
        success: function (data) {
            let tableContent = '';
            data.forEach((item) => {
                tableContent += `
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.documento}</td>
                        <td>${item.nombre}</td>
                        <td>${item.correo}</td>
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

function createOrUpdate() {
    const id = $('#id').val(); // ID solo tiene valor si estamos en modo edición
    const data = {
        documento: $('#documento').val(),
        nombre: $('#nombre').val(),
        correo: $('#correo').val()
    };

    const url = id ? `http://localhost:9000/api/cliente/${id}` : 'http://localhost:9000/api/cliente';
    const method = id ? 'PUT' : 'POST';

    console.log("URL:", url);  // Verifica si la URL incluye el ID en modo edición
    console.log("Método:", method); // Verifica si el método es PUT o POST

    $.ajax({
        url: url,
        method: method,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function () {
            resetForm();
            loadData();
            alert(id ? 'Registro actualizado con éxito' : 'Registro creado con éxito');
        },
        error: function (error) {
            console.error('Error al guardar datos', error);
        }
    });
}


// Editar registro
function editRecord(id) {
    $.ajax({
        url: `http://localhost:9000/api/cliente/${id}`,
        method: 'GET',
        success: function (data) {
            // Llenar el formulario con los datos del registro
            $('#id').val(data.id); // Esto permite que la función `createOrUpdate` sepa que estamos en modo edición
            $('#documento').val(data.documento);
            $('#nombre').val(data.nombre);
            $('#correo').val(data.correo);
            
            // Cambiar el texto del botón a "Actualizar"
            $('#submitButton').text('Actualizar');
        },
        error: function (error) {
            console.error('Error al obtener el registro', error);
        }
    });
}

function resetForm() {
    $('#id').val(''); // Borrar el ID para evitar crear un nuevo registro accidentalmente
    $('#documento').val('');
    $('#nombre').val('');
    $('#correo').val('');
    
    // Cambiar el texto del botón a "Guardar" o su estado original
    $('#submitButton').text('Guardar');
}

// Eliminar registro
function deleteRecord(id) {
    if (confirm('¿Estás seguro de eliminar este registro?')) {
        $.ajax({
            url: `http://localhost:9000/api/cliente/${id}`,
            method: 'DELETE',
            success: function () {
                loadData();
                alert('Registro eliminado con éxito');
            },
            error: function (error) {
                console.error('Error al eliminar registro', error);
            }
        });
    }
}
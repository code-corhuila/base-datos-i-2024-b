$(document).ready(function () {
    loadData();
});

// Cargar datos en la tabla
function loadData() {
    $.ajax({
        url: 'http://localhost:9000/api/servicio',
        method: 'GET',
        success: function (data) {
            let tableContent = '';
            data.forEach((item) => {
                tableContent += `
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.codigo}</td>
                        <td>${item.nombre}</td>
                        <td>${item.precioUnitario.toFixed(2)}</td>
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
    const id = $('#id').val();
    const data = {
        codigo: $('#codigo').val(),
        nombre: $('#nombre').val(),
        precioUnitario: parseFloat($('#precioUnitario').val())
    };

    const url = id ? `http://localhost:9000/api/servicio/${id}` : 'http://localhost:9000/api/servicio';
    const method = id ? 'PUT' : 'POST';

    $.ajax({
        url: url,
        method: method,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function () {
            resetForm();
            loadData();
            alert(id ? 'Servicio actualizado con éxito' : 'Servicio creado con éxito');
        },
        error: function (error) {
            console.error('Error al guardar datos', error);
        }
    });
}

// Editar registro
function editRecord(id) {
    $.ajax({
        url: `http://localhost:9000/api/servicio/${id}`,
        method: 'GET',
        success: function (data) {
            $('#id').val(data.id);
            $('#codigo').val(data.codigo);
            $('#nombre').val(data.nombre);
            $('#precioUnitario').val(data.precioUnitario);
            $('#submitButton').text('Actualizar');
        },
        error: function (error) {
            console.error('Error al obtener el registro', error);
        }
    });
}

function resetForm() {
    $('#id').val('');
    $('#codigo').val('');
    $('#nombre').val('');
    $('#precioUnitario').val('');
    $('#submitButton').text('Guardar');
}

// Eliminar registro
function deleteRecord(id) {
    if (confirm('¿Estás seguro de eliminar este servicio?')) {
        $.ajax({
            url: `http://localhost:9000/api/servicio/${id}`,
            method: 'DELETE',
            success: function () {
                loadData();
                alert('Servicio eliminado con éxito');
            },
            error: function (error) {
                console.error('Error al eliminar servicio', error);
            }
        });
    }
}

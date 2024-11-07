package com.Corhuila.Parque.Service;

import com.Corhuila.Parque.Entity.ServicioCliente;
import com.Corhuila.Parque.IRepository.IServicioClienteRepository;
import com.Corhuila.Parque.IService.IServicioClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ServicioClienteService implements IServicioClienteService {
    @Autowired
    private IServicioClienteRepository repository;

    @Override
    public ServicioCliente save(ServicioCliente servicioServicioCliente) {
        return repository.save(servicioServicioCliente);
    }

    @Override
    public void update(ServicioCliente servicioServicioCliente, Integer id) {
        // Validar si el registro existe en la base de datos.
        Optional<ServicioCliente> up = repository.findById(id);

        if (up.isPresent()) {
            ServicioCliente existingServicioCliente = up.get();
            // Actualizar los valores del objeto existente.
            existingServicioCliente.setCantidad(servicioServicioCliente.getCantidad());
            existingServicioCliente.setTotalPagar(servicioServicioCliente.getTotalPagar());
            existingServicioCliente.setClienteId(servicioServicioCliente.getClienteId());
            existingServicioCliente.setServicioId(servicioServicioCliente.getServicioId());

            // Guardar el objeto existente actualizado.
            repository.save(existingServicioCliente);
        } else {
            System.out.println("No existe registro con ID: " + id);
        }
    }


    @Override
    public List<ServicioCliente> all() {
        return repository.findAll();
    }

    @Override
    public Optional<ServicioCliente> findById(Integer id) {
        return repository.findById(id);
    }

    @Override
    public void delete(Integer id) {
        repository.deleteById(id);
    }
}

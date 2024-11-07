package com.Corhuila.Parque.Service;

import com.Corhuila.Parque.Entity.Cliente;
import com.Corhuila.Parque.IRepository.IClienteRepository;
import com.Corhuila.Parque.IService.IClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ClienteService implements IClienteService {
    @Autowired
    private IClienteRepository repository;

    @Override
    public Cliente save(Cliente cliente) {
        return repository.save(cliente);
    }

    @Override
    public void update(Cliente cliente, Integer id) {
        // Verificar si el registro con el ID dado existe en la base de datos.
        Optional<Cliente> up = repository.findById(id);

        if (up.isPresent()) {
            Cliente existingCliente = up.get();
            // Actualizar los valores del objeto existente.
            existingCliente.setDocumento(cliente.getDocumento());
            existingCliente.setNombre(cliente.getNombre());
            existingCliente.setCorreo(cliente.getCorreo());

            // Guardar el objeto existente actualizado.
            repository.save(existingCliente);
        } else {
            System.out.println("No existe registro con ID: " + id);
        }
    }


    @Override
    public List<Cliente> all() {
        return repository.findAll();
    }

    @Override
    public Optional<Cliente> findById(Integer id) {
        return repository.findById(id);
    }

    @Override
    public void delete(Integer id) {
        repository.deleteById(id);
    }
}

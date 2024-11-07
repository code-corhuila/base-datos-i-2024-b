package com.Corhuila.Parque.IService;

import com.Corhuila.Parque.Entity.ServicioCliente;

import java.util.List;
import java.util.Optional;

public interface IServicioClienteService {

    ServicioCliente save(ServicioCliente servicioCliente);
    void  update(ServicioCliente servicioCliente, Integer id);
    List<ServicioCliente> all();
    Optional<ServicioCliente> findById(Integer id);
    void delete(Integer id);
}

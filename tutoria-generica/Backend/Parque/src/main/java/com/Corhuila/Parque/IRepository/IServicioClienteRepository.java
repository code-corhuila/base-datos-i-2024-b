package com.Corhuila.Parque.IRepository;

import com.Corhuila.Parque.Entity.ServicioCliente;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IServicioClienteRepository extends JpaRepository<ServicioCliente, Integer> {
}

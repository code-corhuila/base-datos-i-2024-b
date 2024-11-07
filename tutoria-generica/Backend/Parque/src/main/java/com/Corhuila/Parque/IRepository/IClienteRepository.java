package com.Corhuila.Parque.IRepository;

import com.Corhuila.Parque.Entity.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IClienteRepository extends JpaRepository<Cliente, Integer> {
}

package com.Corhuila.Parque.IRepository;

import com.Corhuila.Parque.Entity.Servicio;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IServicioRepository extends JpaRepository<Servicio, Integer> {
}

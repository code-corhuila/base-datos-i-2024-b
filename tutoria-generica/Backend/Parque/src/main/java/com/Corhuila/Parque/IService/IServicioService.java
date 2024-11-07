package com.Corhuila.Parque.IService;

import com.Corhuila.Parque.Entity.Servicio;

import java.util.List;
import java.util.Optional;

public interface IServicioService {

    Servicio save(Servicio servicio);
    void  update(Servicio servicio, Integer id);
    List<Servicio> all();
    Optional<Servicio> findById(Integer id);
    void delete(Integer id);
}

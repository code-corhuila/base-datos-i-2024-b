package com.Corhuila.Parque.Controller;

import com.Corhuila.Parque.Entity.Servicio;
import com.Corhuila.Parque.IService.IServicioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RestController
@CrossOrigin("*")
@RequestMapping("api/servicio")
public class ServicioController {
    @Autowired
    private IServicioService service;

    @PostMapping("")
    public Servicio save(@RequestBody Servicio servicio) {
        return service.save(servicio);
    }

    @PutMapping("/{id}")
    public void update(@RequestBody Servicio servicio, @PathVariable Integer id) {
        service.update(servicio, id);
    }

    @GetMapping("")
    public List<Servicio> all() {
        return service.all();
    }

    @GetMapping("/{id}")
    public Optional<Servicio> findById(@PathVariable Integer id) {
        return service.findById(id);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Integer id) {
        service.delete(id);
    }
}

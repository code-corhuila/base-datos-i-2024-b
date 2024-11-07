package com.Corhuila.Parque.Controller;

import com.Corhuila.Parque.Entity.ServicioCliente;
import com.Corhuila.Parque.IService.IServicioClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RestController
@CrossOrigin("*")
@RequestMapping("api/servicioCliente")
public class ServicioClienteController {
    @Autowired
    private IServicioClienteService service;

    @PostMapping("")
    public ServicioCliente save(@RequestBody ServicioCliente servicioServicioCliente) {
        return service.save(servicioServicioCliente);
    }

    @PutMapping("/{id}")
    public void update(@RequestBody ServicioCliente servicioServicioCliente, @PathVariable Integer id) {
        service.update(servicioServicioCliente, id);
    }

    @GetMapping("")
    public List<ServicioCliente> all() {
        return service.all();
    }

    @GetMapping("/{id}")
    public Optional<ServicioCliente> findById(@PathVariable Integer id) {
        return service.findById(id);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Integer id) {
        service.delete(id);
    }
}

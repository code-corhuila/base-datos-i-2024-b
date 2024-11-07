package com.Corhuila.Parque.Controller;

import com.Corhuila.Parque.Entity.Cliente;
import com.Corhuila.Parque.IService.IClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RestController
@CrossOrigin("*")
@RequestMapping("api/cliente")
public class ClienteController {
    @Autowired
    private IClienteService service;

    @PostMapping("")
    public Cliente save(@RequestBody Cliente cliente) {
        return service.save(cliente);
    }

    @PutMapping("/{id}")
    public void update(@RequestBody Cliente cliente, @PathVariable Integer id) {
        service.update(cliente, id);
    }

    @GetMapping("")
    public List<Cliente> all() {
        return service.all();
    }

    @GetMapping("/{id}")
    public Optional<Cliente> findById(@PathVariable Integer id) {
        return service.findById(id);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Integer id) {
        service.delete(id);
    }
}

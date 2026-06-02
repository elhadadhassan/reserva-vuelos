package com.example.reservaVuelos.controllers;

import com.example.reservaVuelos.entities.Vuelo;
import com.example.reservaVuelos.services.VueloServiceImpl;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(path = "api/v1/vuelos")
public class VueloController extends BaseControllerImpl<Vuelo, VueloServiceImpl> {
    @GetMapping("/dto")
    public ResponseEntity<?> getAllDTO() {
        try {
            return ResponseEntity.ok(servicio.findAllDTO());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error: " + e.getMessage());
        }
    }
}

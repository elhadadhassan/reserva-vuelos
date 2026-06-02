package com.example.reservaVuelos.controllers;

import com.example.reservaVuelos.entities.Aerolinea;
import com.example.reservaVuelos.services.AerolineaServiceImpl;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(path = "api/v1/aerolineas")
public class AerolineaController extends BaseControllerImpl<Aerolinea, AerolineaServiceImpl> {
    @GetMapping("/dto")
    public ResponseEntity<?> getAllDTO() {
        try {
            return ResponseEntity.ok(servicio.findAllDTO());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error: " + e.getMessage());
        }
    }
}

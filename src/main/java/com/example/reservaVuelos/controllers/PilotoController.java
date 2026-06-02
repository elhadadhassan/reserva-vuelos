package com.example.reservaVuelos.controllers;

import com.example.reservaVuelos.entities.Piloto;
import com.example.reservaVuelos.services.PilotoServiceImpl;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(path = "api/v1/pilotos")
public class PilotoController extends BaseControllerImpl<Piloto, PilotoServiceImpl> {
}

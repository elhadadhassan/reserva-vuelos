package com.example.reservaVuelos.controllers;

import com.example.reservaVuelos.entities.Tarifa;
import com.example.reservaVuelos.services.TarifaServiceImpl;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(path = "api/v1/tarifas")
public class TarifaController extends BaseControllerImpl<Tarifa, TarifaServiceImpl> {

}

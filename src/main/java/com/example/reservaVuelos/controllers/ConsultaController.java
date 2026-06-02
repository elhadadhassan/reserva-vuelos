package com.example.reservaVuelos.controllers;


import com.example.reservaVuelos.entities.Consulta;
import com.example.reservaVuelos.services.ConsultaServiceImpl;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping(path = "api/v1/consultas")
public class ConsultaController extends BaseControllerImpl<Consulta, ConsultaServiceImpl> {

}

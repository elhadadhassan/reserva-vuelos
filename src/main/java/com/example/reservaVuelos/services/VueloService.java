package com.example.reservaVuelos.services;

import com.example.reservaVuelos.dto.VueloDTO;
import com.example.reservaVuelos.entities.Vuelo;

import java.util.List;

public interface VueloService extends BaseService<Vuelo, Long> {
    List<VueloDTO> findAllDTO() throws Exception;
}

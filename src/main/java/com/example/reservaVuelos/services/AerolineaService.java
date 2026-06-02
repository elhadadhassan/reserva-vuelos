package com.example.reservaVuelos.services;

import com.example.reservaVuelos.dto.AerolineaDTO;
import com.example.reservaVuelos.entities.Aerolinea;

import java.util.List;

public interface AerolineaService extends BaseService<Aerolinea, Long> {
    List<AerolineaDTO> findAllDTO() throws Exception;
}

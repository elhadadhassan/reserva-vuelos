package com.example.reservaVuelos.services;

import com.example.reservaVuelos.dto.AerolineaDTO;
import com.example.reservaVuelos.entities.Aerolinea;
import com.example.reservaVuelos.repositories.AerolineaRepository;
import com.example.reservaVuelos.repositories.BaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AerolineaServiceImpl extends BaseServiceImpl<Aerolinea, Long> implements AerolineaService {
    @Autowired
    private AerolineaRepository aerolineaRepository;

    public AerolineaServiceImpl(BaseRepository<Aerolinea, Long> baseRepository) {
        super(baseRepository);
    }

    @Override
    public List<AerolineaDTO> findAllDTO() throws Exception {
        List<Aerolinea> aerolineas = baseRepository.findAll();
        List<AerolineaDTO> dtos = new ArrayList<>();

        for (Aerolinea a : aerolineas) {
            AerolineaDTO dto = new AerolineaDTO();
            dto.setId(a.getId());
            dto.setNombreAerolinea(a.getNombreAerolinea());
            dtos.add(dto);
        }
        return dtos;
    }
}

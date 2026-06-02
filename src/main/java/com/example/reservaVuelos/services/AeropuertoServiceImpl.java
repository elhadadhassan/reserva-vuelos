package com.example.reservaVuelos.services;

import com.example.reservaVuelos.entities.Aeropuerto;
import com.example.reservaVuelos.repositories.AeropuertoRepository;
import com.example.reservaVuelos.repositories.BaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AeropuertoServiceImpl extends BaseServiceImpl<Aeropuerto, Long> implements AeropuertoService {
    @Autowired
    private AeropuertoRepository aeropuertoRepository;

    public AeropuertoServiceImpl(BaseRepository<Aeropuerto, Long> baseRepository) {
        super(baseRepository);
    }
}

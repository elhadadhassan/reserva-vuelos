package com.example.reservaVuelos.services;

import com.example.reservaVuelos.entities.Piloto;
import com.example.reservaVuelos.repositories.BaseRepository;
import com.example.reservaVuelos.repositories.PilotoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PilotoServiceImpl extends BaseServiceImpl<Piloto, Long> implements PilotoService {
    @Autowired
    private PilotoRepository pilotoRepository;

    public PilotoServiceImpl(BaseRepository<Piloto, Long> baseRepository) {
        super(baseRepository);
    }

}

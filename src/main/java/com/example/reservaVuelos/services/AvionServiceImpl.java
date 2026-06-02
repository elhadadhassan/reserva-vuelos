package com.example.reservaVuelos.services;

import com.example.reservaVuelos.entities.Avion;
import com.example.reservaVuelos.repositories.AvionRepository;
import com.example.reservaVuelos.repositories.BaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AvionServiceImpl extends BaseServiceImpl<Avion, Long> implements AvionService {
    @Autowired
    private AvionRepository avionRepository;

    public AvionServiceImpl(BaseRepository<Avion, Long> baseRepository) {
        super(baseRepository);
    }
}

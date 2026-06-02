package com.example.reservaVuelos.services;

import com.example.reservaVuelos.entities.Tarifa;
import com.example.reservaVuelos.repositories.BaseRepository;
import com.example.reservaVuelos.repositories.TarifaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TarifaServiceImpl extends BaseServiceImpl<Tarifa, Long> implements TarifaService {
    @Autowired
    private TarifaRepository tarifaRepository;

    public TarifaServiceImpl(BaseRepository<Tarifa, Long> baseRepository) {
        super(baseRepository);
    }
}

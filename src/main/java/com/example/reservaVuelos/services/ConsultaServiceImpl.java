package com.example.reservaVuelos.services;

import com.example.reservaVuelos.entities.Consulta;
import com.example.reservaVuelos.repositories.BaseRepository;
import com.example.reservaVuelos.repositories.ConsultaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConsultaServiceImpl extends BaseServiceImpl<Consulta, Long> implements ConsultaService  {
    @Autowired
    private ConsultaRepository consultaRepository;

    public ConsultaServiceImpl(BaseRepository<Consulta, Long> baseRepository) {
        super(baseRepository);
    }
}

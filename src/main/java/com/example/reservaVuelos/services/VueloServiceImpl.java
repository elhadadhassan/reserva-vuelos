package com.example.reservaVuelos.services;

import com.example.reservaVuelos.dto.VueloDTO;
import com.example.reservaVuelos.entities.Aerolinea;
import com.example.reservaVuelos.entities.Aeropuerto;
import com.example.reservaVuelos.entities.Tarifa;
import com.example.reservaVuelos.entities.Vuelo;
import com.example.reservaVuelos.repositories.AerolineaRepository;
import com.example.reservaVuelos.repositories.BaseRepository;
import com.example.reservaVuelos.repositories.TarifaRepository;
import com.example.reservaVuelos.repositories.VueloRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class VueloServiceImpl extends BaseServiceImpl<Vuelo, Long> implements VueloService {
    @Autowired
    private VueloRepository vueloRepository;
    @Autowired
    private TarifaRepository tarifaRepository;
    @Autowired
    private AerolineaRepository aerolineaRepository;

    public VueloServiceImpl(BaseRepository<Vuelo, Long> baseRepository) {
        super(baseRepository);
    }


    @Override
    public List<VueloDTO> findAllDTO() throws Exception {
        List<Vuelo> vuelos = baseRepository.findAll();
        List<VueloDTO> dtos = new ArrayList<>();

        for (Vuelo v : vuelos) {
            VueloDTO dto = new VueloDTO();
            dto.setId(v.getId());
            dto.setNumeroVuelo(v.getNumeroVuelo());
            dto.setFecha(v.getFecha());

            if (v.getAeropuertos().size() > 0) {
                Aeropuerto origen = v.getAeropuertos().get(0);
                dto.setOrigenAeropuerto(origen.getNombreAeropuerto());
                dto.setOrigenCiudad(origen.getCiudad());
            }

            if (v.getAeropuertos().size() > 1) {
                Aeropuerto destino = v.getAeropuertos().get(1);
                dto.setDestinoAeropuerto(destino.getNombreAeropuerto());
                dto.setDestinoCiudad(destino.getCiudad());
            }

            if (v.getAerolinea() != null) {
                dto.setAerolineaNombre(v.getAerolinea().getNombreAerolinea());
            }

            // Datos de la primera tarifa
            if (v.getTarifas() != null && !v.getTarifas().isEmpty()) {
                Tarifa t = v.getTarifas().get(0);
                dto.setClase(t.getClaseTarifa().name());
                dto.setPrecio(t.getPrecioTarifa());
            }

            dtos.add(dto);
        }
        return dtos;
    }


    @Override
    @Transactional
    public Vuelo save(Vuelo entity) throws Exception {


        // 1. EVITAR DUPLICAR AEROLÍNEAS
        if (entity.getAerolinea() != null && entity.getAerolinea().getNombreAerolinea() != null) {
            String nombre = entity.getAerolinea().getNombreAerolinea();

            // Buscar si ya existe una aerolínea con ese nombre
            Aerolinea existente = aerolineaRepository.findByNombreAerolinea(nombre);

            if (existente != null) {
                // Usar la aerolínea que ya está en la base de datos
                entity.setAerolinea(existente);
            }
            // Si no existe, se crea sola automáticamente por el cascade
        }


        // 2. GUARDAR EL VUELO
        Vuelo vuelo = baseRepository.save(entity);


        // 3. GUARDAR LAS TARIFAS
        if (entity.getTarifas() != null && !entity.getTarifas().isEmpty()) {
            for (Tarifa t : entity.getTarifas()) {

                // Asociar la tarifa al vuelo
                t.setVuelo(vuelo);

                // Asignar número de tarifa si no viene
                if (t.getNumeroTarifa() == null) {
                    t.setNumeroTarifa(vuelo.getId().intValue());
                }

                // Calcular precio según la clase
                if (t.getClaseTarifa() != null) {
                    switch (t.getClaseTarifa()) {
                        case ECONOMY:
                            t.setPrecioTarifa(70 + (int)(Math.random() * 120));
                            break;
                        case TURISTA:
                            t.setPrecioTarifa(200 + (int)(Math.random() * 290));
                            break;
                        case BUSINESS:
                            t.setPrecioTarifa(500 + (int)(Math.random() * 500));
                            break;
                        default:
                            t.setPrecioTarifa(70 + (int)(Math.random() * 120));
                            break;
                    }
                } else {
                    t.setPrecioTarifa(70 + (int)(Math.random() * 120));
                }

                // Guardar la tarifa
                tarifaRepository.save(t);
            }
        }

        return vuelo;
    }

}

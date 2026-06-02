package com.example.reservaVuelos.repositories;

import com.example.reservaVuelos.entities.Aerolinea;

public interface AerolineaRepository extends BaseRepository<Aerolinea, Long> {
    Aerolinea findByNombreAerolinea(String nombre);
}

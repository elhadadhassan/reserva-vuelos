package com.example.reservaVuelos.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "aeropuerto")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Audited
public class Aeropuerto extends Base {
    @Column(name = "nombre_aeropuerto")
    private String nombreAeropuerto;

    /*
    @Embedded
    @AttributeOverrides({
            @AttributeOverride(name = "nombreCiudad", column = @Column(name = "nombre_ciudad"))
    })
    private Ciudad ciudad;
    */
    @Column(name = "ciudad")
    private String ciudad;

    @ManyToMany(mappedBy = "aeropuertos")
    @JsonIgnore
    private List<Vuelo> vuelos = new ArrayList<>();

    @ManyToMany(mappedBy = "aeropuertos")
    @JsonIgnore
    private List<Aerolinea> aerolineas = new ArrayList<>();

}

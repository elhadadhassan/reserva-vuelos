package com.example.reservaVuelos.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "aerolinea")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Audited
public class Aerolinea extends Base {
    @Column(name = "nombre_aerolinea")
    private String nombreAerolinea;

    @ManyToMany
    @JoinTable(
            name = "aeropuerto_aerolinea",
            joinColumns = @JoinColumn(name = "id_aerolinea"),
            inverseJoinColumns = @JoinColumn(name = "id_aeropuerto")
    )
    private List<Aeropuerto> aeropuertos = new ArrayList<>();
}

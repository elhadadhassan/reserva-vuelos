package com.example.reservaVuelos.entities;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "vuelo")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Audited
public class Vuelo extends Base {
    @Column(name = "numero_vuelo")
    private int numeroVuelo;
    @ManyToOne
    @JoinColumn(name = "fk_avion",  nullable = true)
    private Avion avion;

    /* La desactivé porque no me andaba
    @Embedded
    @AttributeOverrides({
            @AttributeOverride(name = "fecha", column = @Column(name = "fecha_vuelo"))
    })
    private Fecha fecha;
    */
    @Column(name = "fecha_vuelo")
    private String fecha;

    @ManyToOne
    @JsonIgnore
    @JoinColumn(name = "fk_piloto", nullable = true)
    private Piloto piloto;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "fk_aerolinea", nullable = true)
    private Aerolinea aerolinea;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "vuelo_aeropuerto",
            joinColumns = @JoinColumn(name = "vuelo_id"),
            inverseJoinColumns = @JoinColumn(name = "aeropuerto_id", nullable = true)
    )
    private List<Aeropuerto> aeropuertos = new ArrayList<>();

    @OneToMany(mappedBy = "vuelo")
    private List<Tarifa> tarifas = new ArrayList<>();



}

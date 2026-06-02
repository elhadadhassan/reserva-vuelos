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
@Table(name = "tarifa")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Audited
public class Tarifa extends Base {
    @Column(name = "numero_tarifa")
    private Integer numeroTarifa;

    //@Column(name = "impuesto_tarifa")
    //private int impuestoTarifa;

    @Column(name = "precio_tarifa")
    private Integer precioTarifa;

    @Enumerated(EnumType.STRING)
    @Column(name = "clase_tarifa")
    private Clase claseTarifa;

    @ManyToOne
    @JoinColumn(name = "fk_vuelo")
    @JsonIgnore
    private Vuelo vuelo;
}

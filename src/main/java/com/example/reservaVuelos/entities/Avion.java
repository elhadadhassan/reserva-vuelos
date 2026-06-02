package com.example.reservaVuelos.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "avion")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Audited
public class Avion extends Base {
    @Column(name = "numero_avion")
    private int numeroAvion;
    @Column(name = "capacidad")
    private int capacidad = 150;
    @OneToMany(mappedBy = "avion")
    private List<Asiento> asientos= new ArrayList<>();
}

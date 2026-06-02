package com.example.reservaVuelos.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

@Entity
@Table(name = "asiento")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Audited
public class Asiento extends Base {
    @Column(name = "fila_asiento")
    private int filaAsiento;
    @Column(name = "letra_asiento")
    private String letraAsiento;
    @Enumerated(EnumType.STRING)
    @Column(name = "clase_asiento")
    private Clase claseAsiento;
    @ManyToOne
    @JoinColumn(name = "numero_avion")
    Avion avion;
}

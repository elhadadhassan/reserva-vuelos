package com.example.reservaVuelos.entities;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

@Entity
@Table(name = "consulta")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Audited
public class Consulta extends Base {
    @Column(name = "numero_consulta")
    private int numeroConsulta;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "fk_vuelo")
    private Vuelo vuelo;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "fk_usuario")
    private Usuario usuario;

}

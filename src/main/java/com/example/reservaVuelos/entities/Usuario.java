package com.example.reservaVuelos.entities;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
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
@Table(name = "usuario")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Audited
public class Usuario extends Persona {
    @Column(name = "contrasenia_usuario")
    private String contraseniaUsuario;
    @Column(name = "email_usuario")
    private String correoElectronicoUsuario;

    /*@OneToOne
    @JoinColumn(name = "numero_reserva")
    private Reserva reserva;*/

    @OneToMany(mappedBy = "usuario")
    private List<Consulta> consultas = new ArrayList<>();




}

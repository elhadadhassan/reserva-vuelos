package com.example.reservaVuelos.entities;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Embedded;
import jakarta.persistence.MappedSuperclass;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.envers.Audited;

@MappedSuperclass
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Audited
public class Persona extends Base {
    @Basic
    @Column(name = "dni_persona")
    protected int dniPersona;
    @Column(name = "nombre_persona")
    protected String nombrePersona;
    @Column(name = "apellido_persona")
    protected String apellidoPersona;
}

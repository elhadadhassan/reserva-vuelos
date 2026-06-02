package com.example.reservaVuelos.dto;

public class AerolineaDTO {
    private Long id;
    private String nombreAerolinea;

    public AerolineaDTO() {}

    public AerolineaDTO(Long id, String nombreAerolinea) {
        this.id = id;
        this.nombreAerolinea = nombreAerolinea;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNombreAerolinea() { return nombreAerolinea; }
    public void setNombreAerolinea(String nombreAerolinea) { this.nombreAerolinea = nombreAerolinea; }
}

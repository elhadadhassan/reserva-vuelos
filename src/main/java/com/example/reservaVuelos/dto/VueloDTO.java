package com.example.reservaVuelos.dto;

public class VueloDTO {
    private Long id;
    private int numeroVuelo;
    private String fecha;
    private String origenAeropuerto;
    private String origenCiudad;
    private String destinoAeropuerto;
    private String destinoCiudad;
    private String aerolineaNombre;

    // 👇 AGREGAR ESTO
    private String clase;
    private int precio;

    // Getters y Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public int getNumeroVuelo() { return numeroVuelo; }
    public void setNumeroVuelo(int numeroVuelo) { this.numeroVuelo = numeroVuelo; }

    public String getFecha() { return fecha; }
    public void setFecha(String fecha) { this.fecha = fecha; }

    public String getOrigenAeropuerto() { return origenAeropuerto; }
    public void setOrigenAeropuerto(String origenAeropuerto) { this.origenAeropuerto = origenAeropuerto; }

    public String getOrigenCiudad() { return origenCiudad; }
    public void setOrigenCiudad(String origenCiudad) { this.origenCiudad = origenCiudad; }

    public String getDestinoAeropuerto() { return destinoAeropuerto; }
    public void setDestinoAeropuerto(String destinoAeropuerto) { this.destinoAeropuerto = destinoAeropuerto; }

    public String getDestinoCiudad() { return destinoCiudad; }
    public void setDestinoCiudad(String destinoCiudad) { this.destinoCiudad = destinoCiudad; }

    public String getAerolineaNombre() { return aerolineaNombre; }
    public void setAerolineaNombre(String aerolineaNombre) { this.aerolineaNombre = aerolineaNombre; }

    public String getClase() { return this.clase; }
    public void setClase(String clase) { this.clase = clase; }

    public int getPrecio() { return this.precio; }
    public void setPrecio(int precio) { this.precio = precio; }

}

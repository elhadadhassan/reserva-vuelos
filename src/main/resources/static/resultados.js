const API_URL = 'http://localhost:9000/api/v1';

async function cargarVuelos() {
    const response = await fetch(`${API_URL}/vuelos/dto`);
    const vuelos = await response.json();
    
    const contenedor = document.getElementById('resultadosBusqueda');
    contenedor.innerHTML = '';
    
    for (const v of vuelos) {
        const card = document.createElement('div');
        card.className = 'vuelo-card';
        card.innerHTML = `
            <div class="fecha-vuelo">${v.fecha || 'Sin fecha'}</div>
            <div class="ruta">
                <div class="origen">
                    <div class="ciudad">${v.origenCiudad || '?'}</div>
                    <div class="aeropuerto">${v.origenAeropuerto || '?'}</div>
                </div>
                <div class="vuelo-linea">✈️</div>
                <div class="destino">
                    <div class="ciudad">${v.destinoCiudad || '?'}</div>
                    <div class="aeropuerto">${v.destinoAeropuerto || '?'}</div>
                </div>
            </div>
            <div class="info-vuelo">
                <span class="aerolinea-nombre">${v.aerolineaNombre || 'Sin aerolínea'}</span>
                <span class="clase">${v.clase || 'No especificada'}</span>
                <span class="precio">$${v.precio || 'Consultar'}</span>
            </div>
            <button class="btn-seleccionar" data-id="${v.id}" data-precio="${v.precio}">Seleccionar vuelo</button>

        `;
        contenedor.appendChild(card);
    }
    
    document.querySelectorAll('.btn-seleccionar').forEach(btn => {
        btn.addEventListener('click', () => {
            const vueloId = btn.getAttribute('data-id');
            const precio = btn.getAttribute('data-precio');
            window.location.href = `pasajero.html?vueloId=${vueloId}&precio=${precio}`;
        });
    });
}

cargarVuelos();
// La dirección del backend
const API_URL = 'http://localhost:9000/api/v1';

// Cargar aerolíneas al abrir la página
async function cargarAerolineas() {
    try {
        const response = await fetch(`${API_URL}/aerolineas/dto`);
        const aerolineas = await response.json();
        
        const select = document.getElementById('aerolineaSelect');
        select.innerHTML = '<option value="">Seleccionar aerolínea</option>';
        
        aerolineas.forEach(a => {
            const option = document.createElement('option');
            //option.value = a.id;
            option.value = a.nombreAerolinea;
            //option.textContent = a.nombreAerolinea;
            option.textContent = a.nombreAerolinea;
            select.appendChild(option);
        });
    } catch (error) {
        console.error('Error cargando aerolíneas:', error);
        document.getElementById('aerolineaSelect').innerHTML = '<option value="">Error al cargar</option>';
    }
}

// Enviar consulta al backend
async function enviarConsulta(event) {
    event.preventDefault();
    
    const origen = document.getElementById('origenAeropuerto').value;
    const origenCiudad = document.getElementById('origenCiudad').value;
    const destino = document.getElementById('destinoAeropuerto').value;
    const destinoCiudad = document.getElementById('destinoCiudad').value;
    const fecha = document.getElementById('fechaVuelo').value;
    const clase = document.getElementById('claseSelect').value;
    //const aerolineaId = document.getElementById('aerolineaSelect').value;
    const aerolineaNombre = document.getElementById('aerolineaSelect').value;

    
    if (!origen || !destino || !fecha) {
        alert('Completá origen, destino y fecha');
        return;
    }
    
    // JSON de vuelo con aeropuerto y ciudad
    const vuelo = {
        numeroVuelo: Math.floor(Math.random() * 9000) + 1000,
        fecha: fecha,
        //aerolinea: aerolineaId ? { id: parseInt(aerolineaId) } : null,
        aerolinea: {
        nombreAerolinea: aerolineaNombre 
        },
        aeropuertos: [
            { 
                nombreAeropuerto: origen,
                ciudad: origenCiudad || '' 
            },
            { 
                nombreAeropuerto: destino,
                ciudad: destinoCiudad || ''
            }
        ],
         tarifas: [    
        { claseTarifa: clase }
    ]
    };
    
    console.log('Enviando:', JSON.stringify(vuelo, null, 2));
    
    try {
        const response = await fetch(`${API_URL}/vuelos`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(vuelo)
        });
        
        if (response.ok) {
            const resultado = await response.json();
            alert('✅ ¡Vuelo creado con éxito!');
            console.log('Respuesta:', resultado);

            window.location.href = 'resultados.html';
        } else {
            const error = await response.text();
            alert('❌ Error: ' + error);
        }
    } catch (error) {
        console.error('Error:', error);
        alert('Error de conexión con el servidor');
    }
}

// Configurar cuando la página cargue
window.onload = function() {
    cargarAerolineas();
    
    const boton = document.getElementById('buscarBtn');
    console.log('Botón encontrado:', boton);
    if (boton) {
        boton.onclick = enviarConsulta;
        console.log('Evento asignado');
    } else {
        console.log('Botón no encontrado');
    }
}

// Obtener datos del vuelo desde la URL
const urlParams = new URLSearchParams(window.location.search);
const vueloId = urlParams.get('vueloId');
const precio = urlParams.get('precio');

// Botón Pagar
document.getElementById('btnPagar').onclick = function() {
    // Obtener valores
    const nombre = document.getElementById('nombre').value;
    const apellido = document.getElementById('apellido').value;
    const dni = document.getElementById('documento').value;
    const email = document.getElementById('email').value;
    
    // Validar que no estén vacíos
    if (nombre === "" || apellido === "" || dni === "" || email === "") {
        alert("Completá todos los campos");
        return;
    }
    
    // Validar que DNI sea solo números y máximo 8 dígitos
    if (isNaN(dni)) {
        alert("El DNI debe ser solo números");
        return;
    }
    
    if (dni.length > 8) {
        alert("El DNI no puede tener más de 8 dígitos");
        return;
    }
    
    // Validar email (que tenga @ y .)
    if (email.indexOf("@") === -1 || email.indexOf(".") === -1) {
        alert("Ingresá un correo válido");
        return;
    }
    
    // Todo bien, mostrar mensaje
    alert("✅ Reserva confirmada para " + nombre + " " + apellido + "\nVuelo ID: " + vueloId + "\nTotal: $" + precio + "\nSe enviará un correo a " + email);
    
    // Volver a resultados
    window.location.href = "resultados.html";
};

// Botón Volver
document.getElementById('btnVolver').onclick = function() {
    window.location.href = "resultados.html";
};
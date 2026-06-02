const API_URL = 'http://localhost:9000/api/v1';

// Botón Registrarse
document.getElementById('btnRegistrarse').onclick = async function() {
    // Obtener valores
    const dni = document.getElementById('dni').value;
    const nombre = document.getElementById('nombre').value;
    const apellido = document.getElementById('apellido').value;
    const email = document.getElementById('email').value;
    const confirmarEmail = document.getElementById('confirmarEmail').value;
    const password = document.getElementById('password').value;
    const confirmarPassword = document.getElementById('confirmarPassword').value;
    
    // Validar campos vacíos
    if (dni === "" || nombre === "" || apellido === "" || email === "" || confirmarEmail === "" || password === "" || confirmarPassword === "") {
        alert("❌ Completá todos los campos");
        return;
    }
    
    // Validar DNI (solo números)
    if (isNaN(dni)) {
        alert("❌ El DNI debe ser solo números");
        return;
    }
    
    // Validar correos coinciden
    if (email !== confirmarEmail) {
        alert("❌ Los correos electrónicos no coinciden");
        return;
    }
    
    // Validar contraseñas coinciden
    if (password !== confirmarPassword) {
        alert("❌ Las contraseñas no coinciden");
        return;
    }
    
    // Validar contraseña mínima 4 caracteres
    if (password.length < 4) {
        alert("❌ La contraseña debe tener al menos 4 caracteres");
        return;
    }
    
    // Crear objeto usuario (sin numeroUsuario)
    const usuario = {
        dniPersona: parseInt(dni),
        nombrePersona: nombre,
        apellidoPersona: apellido,
        correoElectronicoUsuario: email,
        contraseniaUsuario: password
    };
    
    try {
        const response = await fetch(`${API_URL}/usuarios`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(usuario)
        });
        
        if (response.ok) {
            const resultado = await response.json();
            alert("✅ Registro exitoso para " + nombre + " " + apellido + "\nSe envió un correo a " + email);
            window.location.href = "index.html";
        } else {
            const error = await response.text();
            alert("❌ Error al registrar: " + error);
        }
    } catch (error) {
        console.error("Error:", error);
        alert("❌ Error de conexión con el servidor");
    }
};

// Botón Volver
document.getElementById('btnVolver').onclick = function() {
    window.history.back();
};
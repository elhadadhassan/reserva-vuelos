package com.example.reservaVuelos.services;

import com.example.reservaVuelos.entities.Usuario;
import com.example.reservaVuelos.repositories.BaseRepository;
import com.example.reservaVuelos.repositories.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuarioServiceImpl extends BaseServiceImpl<Usuario, Long> implements UsuarioService {
    @Autowired
    private UsuarioRepository usuarioRepository;

    public UsuarioServiceImpl(BaseRepository<Usuario, Long> baseRepository) {
        super(baseRepository);
    }

}

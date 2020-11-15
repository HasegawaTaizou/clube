package com.livroJogo.clube.domain.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.livroJogo.clube.domain.model.Usuario;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    List<Usuario> findTodosByNomeContaining(String nome);
	
	Optional<Usuario> findByNome(String nome);
	
	boolean existsByNome(String nome);
}

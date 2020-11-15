package com.livroJogo.clube.domain.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.livroJogo.clube.domain.model.Estado;

@Repository
public interface EstadoRepository extends JpaRepository<Estado, Long> {

    List<Estado> findTodosByNomeContaining(String nome);
	
	Optional<Estado> findByNome(String nome);
	
	boolean existsByNome(String nome);
}

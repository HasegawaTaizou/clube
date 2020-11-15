package com.livroJogo.clube.domain.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.livroJogo.clube.domain.model.Cidade;

@Repository
public interface CidadeRepository extends JpaRepository<Cidade, Long> {

    List<Cidade> findTodasByNomeContaining(String nome);
	
	Optional<Cidade> findByNome(String nome);
	
	boolean existsByNome(String nome);
}

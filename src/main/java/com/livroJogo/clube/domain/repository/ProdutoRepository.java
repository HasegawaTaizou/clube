package com.livroJogo.clube.domain.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.livroJogo.clube.domain.model.Produto;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long> {

    List<Produto> findTodosByNomeContaining(String nome);
	
	Optional<Produto> findByNome(String nome);
	
	boolean existsByNome(String nome);
}

package com.livroJogo.clube.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.livroJogo.clube.domain.exception.EntidadeEmUsoException;
import com.livroJogo.clube.domain.exception.EntidadeNaoEncontradaException;
import com.livroJogo.clube.domain.model.Produto;
import com.livroJogo.clube.domain.repository.ProdutoRepository;

@Service
public class CadastroProdutoService {

	@Autowired
	private ProdutoRepository produtoRepository;
	
	public Produto salvar(Produto produto) {
		return produtoRepository.save(produto);
	}
	
	public void excluir(Long produtoId) {
		try {
			produtoRepository.deleteById(produtoId);
			
		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException(
				String.format("Não existe um cadastro de produto com código %d", produtoId));
		
		} catch (DataIntegrityViolationException e) {
			throw new EntidadeEmUsoException(
				String.format("Produto de código %d não pode ser removido, pois está em uso", produtoId));
		}
	}
	
}

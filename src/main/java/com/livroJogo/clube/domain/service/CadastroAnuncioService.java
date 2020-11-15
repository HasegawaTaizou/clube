package com.livroJogo.clube.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.livroJogo.clube.domain.exception.EntidadeEmUsoException;
import com.livroJogo.clube.domain.exception.EntidadeNaoEncontradaException;
import com.livroJogo.clube.domain.model.Anuncio;
import com.livroJogo.clube.domain.repository.AnuncioRepository;

@Service
public class CadastroAnuncioService {

	@Autowired
	private AnuncioRepository anuncioRepository;
	
	public Anuncio salvar(Anuncio anuncio) {
		return anuncioRepository.save(anuncio);
	}
	
	public void excluir(Long anuncioId) {
		try {
			anuncioRepository.deleteById(anuncioId);
			
		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException(
				String.format("Não existe um cadastro de anuncio com código %d", anuncioId));
		
		} catch (DataIntegrityViolationException e) {
			throw new EntidadeEmUsoException(
				String.format("Anuncio de código %d não pode ser removido, pois está em uso", anuncioId));
		}
	}
	
}

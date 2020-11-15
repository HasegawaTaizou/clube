package com.livroJogo.clube.api.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.livroJogo.clube.domain.exception.EntidadeEmUsoException;
import com.livroJogo.clube.domain.exception.EntidadeNaoEncontradaException;
import com.livroJogo.clube.domain.model.Anuncio;
import com.livroJogo.clube.domain.repository.AnuncioRepository;
import com.livroJogo.clube.domain.service.CadastroAnuncioService;

@RestController
@RequestMapping("/anuncios")
public class AnuncioController {

	@Autowired
	private AnuncioRepository anuncioRepository;
	
	@Autowired
	private CadastroAnuncioService cadastroAnuncio;
	
	@GetMapping
	public List<Anuncio> listar() {
		return anuncioRepository.findAll();
	}
	
	@GetMapping("/{anuncioId}")
	public ResponseEntity<Anuncio> buscar(@PathVariable Long anuncioId) {
		Optional<Anuncio> estado = anuncioRepository.findById(anuncioId);
		
		if (estado.isPresent()) {
			return ResponseEntity.ok(estado.get());
		}
		
		return ResponseEntity.notFound().build();
	}
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public Anuncio adicionar(@RequestBody Anuncio anuncio) {
		return cadastroAnuncio.salvar(anuncio);
	}
	
	@PutMapping("/{anuncioId}")
	public ResponseEntity<Anuncio> atualizar(@PathVariable Long anuncioId,
			@RequestBody Anuncio anuncio) {
		Anuncio anuncioAtual = anuncioRepository.findById(anuncioId).orElse(null);
		
		if (anuncioAtual != null) {
			BeanUtils.copyProperties(anuncio, anuncioAtual, "id");
			
			anuncioAtual = cadastroAnuncio.salvar(anuncioAtual);
			return ResponseEntity.ok(anuncioAtual);
		}
		
		return ResponseEntity.notFound().build();
	}
	
	@DeleteMapping("/{anuncioId}")
	public ResponseEntity<?> remover(@PathVariable Long anuncioId) {
		try {
			cadastroAnuncio.excluir(anuncioId);	
			return ResponseEntity.noContent().build();
			
		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.notFound().build();
			
		} catch (EntidadeEmUsoException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT)
					.body(e.getMessage());
		}
	}
	
}

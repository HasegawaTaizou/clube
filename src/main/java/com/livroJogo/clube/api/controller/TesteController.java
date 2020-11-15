package com.livroJogo.clube.api.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.livroJogo.clube.domain.model.Cidade;
import com.livroJogo.clube.domain.model.Estado;
import com.livroJogo.clube.domain.model.Produto;
import com.livroJogo.clube.domain.model.Usuario;
import com.livroJogo.clube.domain.repository.CidadeRepository;
import com.livroJogo.clube.domain.repository.EstadoRepository;
import com.livroJogo.clube.domain.repository.ProdutoRepository;
import com.livroJogo.clube.domain.repository.UsuarioRepository;

@RestController
@RequestMapping("/teste")
public class TesteController {
	
	@Autowired
	private CidadeRepository cidadeRepository;
	
	@Autowired
	private EstadoRepository estadoRepository;
	
	@Autowired
	private ProdutoRepository produtoRepository;
	
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@GetMapping("/cidades/por-nome")
	public List<Cidade> cidadesPorNome(String nome) {
		return cidadeRepository.findTodasByNomeContaining(nome);
	}
	
	@GetMapping("/cidades/unica-por-nome")
	public Optional<Cidade> cidadePorNome(String nome) {
		return cidadeRepository.findByNome(nome);
	}
	
	@GetMapping("/cidades/exists")
	public boolean cidadeExists(String nome) {
		return cidadeRepository.existsByNome(nome);
	}
	
	@GetMapping("/estados/por-nome")
	public List<Estado> estadosPorNome(String nome) {
		return estadoRepository.findTodosByNomeContaining(nome);
	}
	
	@GetMapping("/estados/unico-por-nome")
	public Optional<Estado> estadoPorNome(String nome) {
		return estadoRepository.findByNome(nome);
	}
	
	@GetMapping("/estados/exists")
	public boolean estadoExists(String nome) {
		return estadoRepository.existsByNome(nome);
	}
	
	@GetMapping("/produtos/por-nome")
	public List<Produto> produtosPorNome(String nome) {
		return produtoRepository.findTodosByNomeContaining(nome);
	}
	
	@GetMapping("/produtos/unico-por-nome")
	public Optional<Produto> produtoPorNome(String nome) {
		return produtoRepository.findByNome(nome);
	}
	
	@GetMapping("/produtos/exists")
	public boolean produtoExists(String nome) {
		return produtoRepository.existsByNome(nome);
	}
	
	@GetMapping("/usuarios/por-nome")
	public List<Usuario> usuariosPorNome(String nome) {
		return usuarioRepository.findTodosByNomeContaining(nome);
	}
	
	@GetMapping("/usuarios/unico-por-nome")
	public Optional<Usuario> usuarioPorNome(String nome) {
		return usuarioRepository.findByNome(nome);
	}
	
	@GetMapping("/usuarios/exists")
	public boolean usuarioExists(String nome) {
		return usuarioRepository.existsByNome(nome);
	}
	
}

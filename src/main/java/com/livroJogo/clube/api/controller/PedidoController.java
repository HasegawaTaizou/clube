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
import com.livroJogo.clube.domain.model.Pedido;
import com.livroJogo.clube.domain.repository.PedidoRepository;
import com.livroJogo.clube.domain.service.CadastroPedidoService;

@RestController
@RequestMapping("/pedidos")
public class PedidoController {

	@Autowired
	private PedidoRepository pedidoRepository;
	
	@Autowired
	private CadastroPedidoService cadastroPedido;
	
	@GetMapping
	public List<Pedido> listar() {
		return pedidoRepository.findAll();
	}
	
	@GetMapping("/{pedidoId}")
	public ResponseEntity<Pedido> buscar(@PathVariable Long pedidoId) {
		Optional<Pedido> pedido = pedidoRepository.findById(pedidoId);
		
		if (pedido.isPresent()) {
			return ResponseEntity.ok(pedido.get());
		}
		
		return ResponseEntity.notFound().build();
	}
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public Pedido adicionar(@RequestBody Pedido pedido) {
		return cadastroPedido.salvar(pedido);
	}
	
	@PutMapping("/{pedidoId}")
	public ResponseEntity<Pedido> atualizar(@PathVariable Long pedidoId,
			@RequestBody Pedido pedido) {
		Pedido pedidoAtual = pedidoRepository.findById(pedidoId).orElse(null);
		
		if (pedidoAtual != null) {
			BeanUtils.copyProperties(pedido, pedidoAtual, "id");
			
			pedidoAtual = cadastroPedido.salvar(pedidoAtual);
			return ResponseEntity.ok(pedidoAtual);
		}
		
		return ResponseEntity.notFound().build();
	}
	
	@DeleteMapping("/{pedidoId}")
	public ResponseEntity<?> remover(@PathVariable Long pedidoId) {
		try {
			cadastroPedido.excluir(pedidoId);	
			return ResponseEntity.noContent().build();
			
		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.notFound().build();
			
		} catch (EntidadeEmUsoException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT)
					.body(e.getMessage());
		}
	}
	
}

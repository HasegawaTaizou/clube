package com.livroJogo.clube.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.livroJogo.clube.domain.exception.EntidadeEmUsoException;
import com.livroJogo.clube.domain.exception.EntidadeNaoEncontradaException;
import com.livroJogo.clube.domain.model.Pedido;
import com.livroJogo.clube.domain.repository.PedidoRepository;

@Service
public class CadastroPedidoService {

	@Autowired
	private PedidoRepository pedidoRepository;
	
	public Pedido salvar(Pedido pedido) {
		return pedidoRepository.save(pedido);
	}
	
	public void excluir(Long pedidoId) {
		try {
			pedidoRepository.deleteById(pedidoId);
			
		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException(
				String.format("Não existe um cadastro de pedido com código %d", pedidoId));
		
		} catch (DataIntegrityViolationException e) {
			throw new EntidadeEmUsoException(
				String.format("Pedido de código %d não pode ser removido, pois está em uso", pedidoId));
		}
	}
	
}

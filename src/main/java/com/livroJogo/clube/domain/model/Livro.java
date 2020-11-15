package com.livroJogo.clube.domain.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
public class Livro {

	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private Integer isbn;
	
	@Column(nullable = false)
	private String autor;
	
	@Column(nullable = false)
	private BigDecimal peso;
	
	@Column(nullable = false)
	private BigDecimal profundidade;
	
	@Column(nullable = false)
	private Integer quantidadePaginas;
	
	@Column(nullable = false)
	private BigDecimal largura;
	
	@Column(nullable = false)
	private BigDecimal altura;
	
	@ManyToOne
	@JoinColumn(nullable = false)
	private Produto produto;
	
	private EstadoLivro estadoLivro;
	
	private GeneroLivro generoLivro;
	
}

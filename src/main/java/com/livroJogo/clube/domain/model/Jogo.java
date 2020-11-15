package com.livroJogo.clube.domain.model;

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
public class Jogo {

	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private String requisitosMinimos;
	
	@Column(nullable = false)
	private String requisitosRecomendados;
	
	@ManyToOne
	@JoinColumn(nullable = false)
	private Produto produto;
	
	private RestricaoIdadeJogo restricaoIdadeJogo;
	
	private GeneroJogo generoJogo;
	
}

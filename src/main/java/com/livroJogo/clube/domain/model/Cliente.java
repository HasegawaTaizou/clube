package com.livroJogo.clube.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
public class Cliente {
	
	@EqualsAndHashCode.Include
	@Id
	private Long id;
	
	@Column(nullable = false)
	private Integer cpf;
	
	@Column(nullable = false)
	private String telefone;	
	
	@ManyToOne
	@JoinColumn(nullable = false, name = "cliente_usuario_id")
	private Usuario usuario;
	
}

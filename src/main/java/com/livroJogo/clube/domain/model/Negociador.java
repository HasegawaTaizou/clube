package com.livroJogo.clube.domain.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
public class Negociador {
	
	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private Integer cpf;
	
	@Column(nullable = false)
	private String telefone;	
	
	@ManyToOne
	@JoinColumn(nullable = false, name = "negociador_usuario_id")
	private Usuario usuario;
	
	@JsonIgnore
	@ManyToMany
	@JoinTable(name = "negociador_anuncio",
			joinColumns = @JoinColumn(name = "negociador_id"),
			inverseJoinColumns = @JoinColumn(name = "anuncio_id"))
	private List<Anuncio> anuncio = new ArrayList<>();
	
}

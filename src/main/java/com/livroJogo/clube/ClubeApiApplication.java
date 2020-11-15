package com.livroJogo.clube;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.livroJogo.clube.infrastructure.repository.CustomJpaRepositoryImpl;

@SpringBootApplication
@EnableJpaRepositories(repositoryBaseClass = CustomJpaRepositoryImpl.class)
public class ClubeApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(ClubeApiApplication.class, args);
	}

}

create table estado (
  id bigint not null auto_increment,
  nome varchar(255) not null,

  primary key (id)
) engine=InnoDB default charset=utf8;

create table cidade (
  id bigint not null auto_increment,
  nome varchar(255) not null,
  estado_id bigint not null,

  primary key (id, estado_id)
) engine=InnoDB default charset=utf8; 

create table usuario (
  id bigint not null auto_increment,
  data_cadastro datetime not null,
  email varchar(255) not null,
  endereco_bairro varchar(255) not null,
  endereco_cep varchar(255) not null,
  endereco_complemento varchar(255) not null,
  endereco_logradouro varchar(255) not null,
  endereco_numero varchar(255) not null,
  nome varchar(255) not null,
  senha varchar(255) not null,
  endereco_cidade_id bigint not null,

  primary key (id, endereco_cidade_id)
) engine=InnoDB default charset=utf8;

create table cliente (
  id bigint not null auto_increment,
  cpf integer not null,
  telefone varchar(255) not null,
  cliente_usuario_id bigint not null,

  primary key (id, cliente_usuario_id)
) engine=InnoDB default charset=utf8;

create table negociador (
  id bigint not null auto_increment,
  cpf integer not null,
  telefone varchar(255) not null,
  negociador_usuario_id bigint not null,

  primary key (id, negociador_usuario_id)
) engine=InnoDB default charset=utf8;

create table anuncio (
  id bigint not null auto_increment,
  data_criacao datetime(6), 
  anuncio_negociador_id bigint not null, 

primary key (id, anuncio_negociador_id)
) engine=InnoDB default charset=utf8;

create table negociador_anuncio (
  negociador_id bigint not null, 
  anuncio_id bigint not null,

  primary key (negociador_id, anuncio_id)
) engine=InnoDB default charset=utf8;

create table produto (
  id bigint not null auto_increment,
  ativo bit not null,
  descricao varchar(255) not null,
  nome varchar(255) not null,
  preco decimal(19, 2) not null,

  primary key (id)
) engine=InnoDB default charset=utf8;

create table jogo (
  id bigint not null auto_increment,
  genero_jogo varchar(255) not null,
  requisitos_minimos varchar(255) not null,
  requisitos_recomendados varchar(255) not null,
  restricao_idade_jogo varchar(255) not null,
  produto_id bigint not null,

  primary key (id, produto_id)
) engine=InnoDB default charset=utf8;

create table livro (
  id bigint not null auto_increment,
  isbn integer not null,
  altura decimal(19, 2) not null,
  autor varchar(255) not null,
  estado_livro varchar(255) not null,
  genero_livro varchar(255) not null,
  largura decimal(19, 2) not null,
  peso decimal(19, 2) not null,
  profundidade decimal(19, 2) not null,
  quantidade_paginas integer not null,
  produto_id bigint not null,

  primary key (id, produto_id)
) engine=InnoDB default charset=utf8; 

create table pedido (
  id bigint not null auto_increment,
  data_cancelamento datetime(6),
  data_confirmacao datetime(6),
  data_criacao datetime(6),
  data_entrega datetime(6),
  endereco_bairro varchar(255) not null,
  endereco_cep varchar(255) not null,
  endereco_complemento varchar(255) not null,
  endereco_logradouro varchar(255) not null,
  endereco_numero varchar(255) not null,
  status varchar(255) not null,
  valor_total decimal(19, 2) not null,
  usuario_cliente_id bigint not null,
  endereco_cidade_id bigint not null,

  primary key (id, usuario_cliente_id, endereco_cidade_id)
) engine=InnoDB default charset=utf8; 

create table item_pedido (
  id bigint not null auto_increment,
  preco_total decimal(19, 2) not null,
  quantidade integer not null,
  pedido_id bigint not null,
  produto_id bigint not null,

  primary key (id, pedido_id, produto_id)
) engine=InnoDB default charset=utf8;

alter table cidade add constraint fk_cliente_estado 
foreign key (estado_id) references estado (id);

alter table cliente add constraint fk_cliente_usuario
foreign key (cliente_usuario_id) references usuario (id);

alter table negociador add constraint fk_negociador_usuario
foreign key (negociador_usuario_id) references usuario (id);

alter table anuncio add constraint fk_anuncio_negociador 
foreign key (anuncio_negociador_id) references negociador (id);

alter table negociador_anuncio add constraint fk_negociador_anuncio_anuncio 
foreign key (anuncio_id) references anuncio (id);

alter table negociador_anuncio add constraint fk_negociador_anuncio_negociador
foreign key (negociador_id) references negociador (id);

alter table item_pedido add constraint fk_item_pedido_pedido
foreign key (pedido_id) references pedido (id);

alter table item_pedido add constraint fk_item_pedido_produto 
foreign key (produto_id) references produto (id);

alter table jogo add constraint fk_jogo_produto 
foreign key (produto_id) references produto (id);

alter table livro add constraint fk_livro_produto 
foreign key (produto_id) references produto (id);

alter table pedido add constraint fk_pedido_cliente 
foreign key (usuario_cliente_id) references cliente (id);

alter table pedido add constraint fk_pedido_cidade 
foreign key (endereco_cidade_id) references cidade (id);

alter table usuario add constraint fk_usuario_cidade  
foreign key (endereco_cidade_id) references cidade (id);

insert into estado (id, nome) values (1, 'Minas Gerais');
insert into estado (id, nome) values (2, 'São Paulo');
insert into estado (id, nome) values (3, 'Ceará');

insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1);
insert into cidade (id, nome, estado_id) values (2, 'São Paulo', 2);
insert into cidade (id, nome, estado_id) values (3, 'Fortaleza', 3);

insert into produto (id, ativo, descricao, nome, preco) values (1, 1, 'livro do perci jackinson', 'livro', 19.90);
insert into produto (id, ativo, descricao, nome, preco) values (2, 1, 'livro do miguel e sexto ano', 'livro', 15.50);
insert into produto (id, ativo, descricao, nome, preco) values (3, 1, 'jogo GTA5', 'jogo', 29.99);

insert into pedido (id, data_cancelamento, data_confirmacao, data_criacao, data_entrega, endereco_bairro, endereco_cep, endereco_complemento, endereco_logradouro, endereco_numero, status, valor_total, usuario_cliente_id, endereco_cidade_id) values (1, null, '2020-11-15 13:14:30', '2020-11-15 13:14:30', '2020-12-15 11:34:20', 'Jardim dos frangos', '12345678', 'Perto dos outros frangos', 'Rua dos frangos', '123', 'entrege', 129.89, 1, 1);
insert into pedido (id, data_cancelamento, data_confirmacao, data_criacao, data_entrega, endereco_bairro, endereco_cep, endereco_complemento, endereco_logradouro, endereco_numero, status, valor_total, usuario_cliente_id, endereco_cidade_id) values (2, null, '2020-11-13 23:10:20', '2020-11-15 11:05:00', '2020-12-17 12:34:20', 'Jardim dos anonimous', '23232323', 'Perto dos outros anonimous', 'Rua dos anonimous', '456', 'entrege', 34.59, 1, 1);
insert into pedido (id, data_cancelamento, data_confirmacao, data_criacao, data_entrega, endereco_bairro, endereco_cep, endereco_complemento, endereco_logradouro, endereco_numero, status, valor_total, usuario_cliente_id, endereco_cidade_id) values (3, null, '2020-11-23 10:05:14', '2020-11-23 12:10:40', '2020-12-25 13:34:20', 'Jardim dos coelho', '987987799', 'Perto dos outros coelhos', 'Rua dos coelhos', '789', 'entrege', 12.39, 1, 1);

insert into item_pedido (id, preco_total, quantidade, pedido_id, produto_id) values (1, 23.70, 4, 1, 1);
insert into item_pedido (id, preco_total, quantidade, pedido_id, produto_id) values (2, 45.80, 7, 2, 2);
insert into item_pedido (id, preco_total, quantidade, pedido_id, produto_id) values (3, 90.85, 9, 3, 3);

insert into livro (id, isbn, altura, autor, estado_livro, genero_livro, largura, peso, profundidade, quantidade_paginas, produto_id) values (1, 121331121, 2.5, 'jose desconhecido', 'perfeito', 'ficcao', 0.5, 23, 4, 543, 1);
insert into livro (id, isbn, altura, autor, estado_livro, genero_livro, largura, peso, profundidade, quantidade_paginas, produto_id) values (2, 784329757, 4.3, 'mc gorila', 'medio', 'romance', 0.6, 40, 5, 133, 2);

insert into jogo (id, genero_jogo, requisitos_minimos, requisitos_recomendados, restricao_idade_jogo, produto_id) values (1, acao, 'um pczin bom', 'um pc bala', 'maior_18', 3);

insert into usuario (id, data_cadastro, email, endereco_bairro, endereco_cep, endereco_complemento, endereco_logradouro, endereco_numero, nome, senha, endereco_cidade_id) values (1, utc_timestamp, 'batataotodotorto@gmail.com', 'aleatorio', '1243356', 'perto do carlão', 'rua não sei das quantas', '66', 'apenas1ignorante', '1234', 1);
insert into usuario (id, data_cadastro, email, endereco_bairro, endereco_cep, endereco_complemento, endereco_logradouro, endereco_numero, nome, senha, endereco_cidade_id) values (2, utc_timestamp, 'slakkkj@gmail.com', 'jardim sla', '1312455', 'perto do bar do chicão', 'rua dos herois', '12', 'Ozzymandias', '5678', 2);
insert into usuario (id, data_cadastro, email, endereco_bairro, endereco_cep, endereco_complemento, endereco_logradouro, endereco_numero, nome, senha, endereco_cidade_id) values (3, utc_timestamp, 'soyhackisbaby@gmail.com', 'hackis ali', '9390068', 'perto do bueiro', 'rua dos hacki', '98', 'Turko', '8900', 2);

insert into cliente (id, cpf, telefone, cliente_usuario_id) values (1, 334143443, 2322141, 1);
insert into cliente (id, cpf, telefone, cliente_usuario_id) values (2, 39809776, 3122131, 2);

insert into negociador (id, cpf, telefone, negociador_usuario_id) values (3, 33412345, 5654661, 3);

insert into negociador_anuncio (negociador_id, anuncio_id) values (3, 1);


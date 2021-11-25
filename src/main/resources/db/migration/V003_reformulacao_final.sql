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

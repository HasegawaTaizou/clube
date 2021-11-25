create table usuario (
  id bigint not null auto_increment,
  email varchar(255) not null,
  senha varchar(255) not null,

  primary key (id)
) engine=InnoDB default charset=utf8;

create table anuncio (
  id bigint not null auto_increment,
  genero varchar(255) not null,
  restricao_idade varchar(255) not null,

  primary key (id)
) engine=InnoDB default charset=utf8;

create table usuario_anuncio (
  usuario_id bigint not null, 
  anuncio_id bigint not null,

  primary key (negociador_id, anuncio_id)
) engine=InnoDB default charset=utf8;

create table pedido (
  id bigint not null auto_increment,
  data_criacao datetime(6) not null,
  valor_total decimal(19, 2) not null,
  usuario_cliente_id bigint not null,
  
  primary key (id, usuario_cliente_id, endereco_cidade_id)
) engine=InnoDB default charset=utf8; 

create table item_pedido (
  id bigint not null auto_increment,
  preco_unitario decimal(19, 2) not null,
  quantidade integer not null,
  pedido_id bigint not null,
  produto_id bigint not null,

  primary key (id, pedido_id, produto_id)
) engine=InnoDB default charset=utf8;


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

alter table pedido add constraint fk_pedido_cliente 
foreign key (usuario_cliente_id) references cliente (id);

alter table pedido add constraint fk_pedido_cidade 
foreign key (endereco_cidade_id) references cidade (id);

alter table usuario add constraint fk_usuario_cidade  
foreign key (endereco_cidade_id) references cidade (id);

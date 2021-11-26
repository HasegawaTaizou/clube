create table usuario (
  id bigint not null auto_increment,
  email varchar(55) not null,
  senha varchar(55) not null,
  anuncio_id bigint null,

  primary key (id, anuncio_id)
) engine=InnoDB default charset=utf8;

create table anuncio (
  id bigint not null auto_increment,
  titulo varchar(55) not null,
  plataforma varchar(55) not null,
  preco decimal(19, 2) not null,
  descricao varchar(55) not null,
  genero varchar(55) not null,
  url_imagem varchar(55) not null,
  restricao_idade varchar(55) not null,
  favorito boolean null,

  primary key (id)
) engine=InnoDB default charset=utf8;

create table usuario_anuncio (
  usuario_id bigint not null, 
  anuncio_id bigint not null,

  primary key (usuario_id, anuncio_id)
) engine=InnoDB default charset=utf8;

create table pedido (
  id bigint not null auto_increment,
  data_criacao datetime(6) not null,
  valor_total decimal(19, 2) not null,
  usuario_cliente_id bigint not null,
  
  primary key (id, usuario_cliente_id)
) engine=InnoDB default charset=utf8; 

create table item_pedido (
  id bigint not null auto_increment,
  preco_unitario decimal(19, 2) not null,
  quantidade integer not null,
  pedido_id bigint not null,
  anuncio_id bigint not null,

  primary key (id, pedido_id, anuncio_id)
) engine=InnoDB default charset=utf8;


alter table usuario add constraint fk_usuario_anuncio  
foreign key (anuncio_id) references anuncio (id); -- 

alter table anuncio_compra add constraint fk_anuncio_compra_anuncio
foreign key (anuncio_id) references anuncio (id); --

alter table anuncio_compra add constraint fk_anuncio_compra_compra 
foreign key (compra_id) references compra (id); -- 

alter table anuncio_compra add constraint fk_anuncio_compra_anuncio
foreign key (anuncio_id) references anuncio (id); -- 

alter table pedido add constraint fk_pedido_usuario 
foreign key (usuario_cliente_id) references usuario (id);

alter table item_pedido add constraint fk_item_pedido_pedido
foreign key (pedido_id) references pedido (id);

alter table item_pedido add constraint fk_item_pedido_produto 
foreign key (produto_id) references produto (id);

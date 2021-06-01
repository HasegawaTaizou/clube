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
  ativo bit not null,
  nome varchar(255) not null,
  sobrenome varchar(255) not null,
  senha varchar(255) not null,
  email varchar(255) not null,
  sexo char(1) not null,
  endereco_pais varchar(255) not null,
  endereco_bairro varchar(255) not null,
  endereco_cep varchar(255) not null,
  endereco_logradouro varchar(255) not null,
  favorito int null,
  endereco_cidade_id bigint not null,
  anuncio_id bigint null,
  compra_id bigint null,

  primary key (id, endereco_cidade_id, anuncio_id, compra_id)
) engine=InnoDB default charset=utf8;

create table anuncio (
  id bigint not null auto_increment,
  data_criacao datetime(6) not null, 
  quantidade integer not null,
  ativo bit not null,
  nome varchar(255) not null,
  preco decimal(19, 2) not null,
  descricao varchar(255) not null,
  genero varchar(255) not null,
  restricao_idade varchar(255) not null, 

  primary key (id)
) engine=InnoDB default charset=utf8; 

create table compra (
  id bigint not null auto_increment,
  data_compra datetime(6) not null,
  quantidade integer not null,
  (chave estrangeira em anuncio ou compra?)
  
  primary key (id)
) engine=InnoDB default charset=utf8;

alter table cidade add constraint fk_cliente_estado 
foreign key (estado_id) references estado (id);

alter table usuario add constraint fk_usuario_cidade  
foreign key (endereco_cidade_id) references cidade (id);

alter table usuario add constraint fk_usuario_anuncio  
foreign key (anuncio_id) references anuncio (id);

alter table usuario add constraint fk_usuario_compra  
foreign key (compra_id) references compra (id);

insert into estado (id, nome) values (1, 'Minas Gerais');
insert into estado (id, nome) values (2, 'São Paulo');
insert into estado (id, nome) values (3, 'Ceará');

insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1);
insert into cidade (id, nome, estado_id) values (2, 'São Paulo', 2);
insert into cidade (id, nome, estado_id) values (3, 'Fortaleza', 3);

insert into usuario (id, data_cadastro, ativo, nome, sobrenome, senha, email, sexo, endereco_pais, endereco_bairro, endereco_cep, endereco_logradouro, favorito, endereco_cidade_id, anuncio_id, compra_id) values (1, utc_timestamp, 1, 'joao', 'pereira', 'abc', 'joaopereira@gmail.com', 'M', 'Brasil', 'aaaa', '11111-111', 'aaaa', 0, 'aaaa', null, null);
insert into usuario (id, data_cadastro, ativo, nome, sobrenome, senha, email, sexo, endereco_pais, endereco_bairro, endereco_cep, endereco_logradouro, favorito, endereco_cidade_id, anuncio_id, compra_id) values (2, utc_timestamp, 1, 'guilherme', 'oliveira', 'def', 'guilhermeoliveira@gmail.com', 'M', 'Brasil', 'bbbb', '2222-222', 'bbbb', 0, 'bbbb', null, 1);
insert into usuario (id, data_cadastro, ativo, nome, sobrenome, senha, email, sexo, endereco_pais, endereco_bairro, endereco_cep, endereco_logradouro, favorito, endereco_cidade_id, anuncio_id, compra_id) values (3, utc_timestamp, 1, 'gabriel', 'silva', 'ghi', 'gabrielsilva@gmail.com', 'M', 'Brasil', 'cccc', '33333-333', 'cccc', 0, 'cccc', 1, null);

insert into anuncio () values (); anuncio pode ser comprado N vezes e a compra pode ter N anuncio

insert into compra (id, data_compra, quantidade, anuncio_id) values (1, '2020-11-15 13:14:30', 1, 1);

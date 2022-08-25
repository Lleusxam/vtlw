DROP DATABASE DB_VTL;
create database BD_VTL;
use DB_VTL;


#Login
create table tb_login(
log_codigo int not null auto_increment primary key,
log_email varchar(73) not null,
log_senha varchar(73) not null,
log_cad_CPF int not null references tb_cadastrocliente(cad_CPF)
);

#Cadastro Cliente
create table tb_cadastrocliente(
cad_CPF int(11) not null primary key,
cad_Nome varchar(73) not null,
cad_email varchar(73) not null,
cad_senha varchar(73) not null,
cad_DTNASC date not null
);

#Cadastro de Troca e Venda
create table tb_cadastroVT(
ctv_codigo int not null auto_increment primary key,
ctv_sin_codigo int not null references tb_sinopses(sin_codigo),
ctv_tdl_codigo int not null references tb_titulos(tdl_codigo),
ctv_rdc_codigo int not null references te_estadosdeconservacao(edc_estadodeconservacao),
ctv_fotodolivro mediumblob not null
);

#Autores
create table tb_autores(
aut_autor varchar(73) not null,
aut_ctv_codigo int not null references tb_cadastoVT(ctv_codigo),
primary key(aut_autor, ctv_codigo)
);

#Sinopses
create table tb_sinopses(
sin_codigo int not null auto_increment primary key,
sin_sinopse varchar(200) not null
);

#Titulos
create table tb_titulos(
tdl_codigo int not null auto_increment primary key,
tdl_titulo varchar(73) not null
);

create table tb_estadosdeconservacao(
edc_codigo int not null auto_increment primary key,
edc_estadodeconservacao varchar(73) not null
);

#inicio
create table tb_inicio(
ini_codigo int not null auto_increment primary key,
ini_log_codigo int not null references tb_login(log_codigo),
ini_tro_codigo int not null references tb_troca(tro_codigo),
ini_ven_codigo int not null references tb_venda(ven_codigo)
);

#Troca
create table tb_troca(
tro_codigo int not null auto_increment primary key,
tro_ctv_codigo int not null references tb_cadastroVT(ctv_codigo)
);

#Venda
create table tb_venda(
ven_codigo int not null auto_increment primary key,
ven_ctv_codigo int not null references tb_cadastroVT(ctv_codigo),
ven_val_codigo int not null references tb_valores(valcodigo)
);

#Valores
create table tb_valores(
val_codigo int not null auto_increment primary key,
val_valor float not null
);
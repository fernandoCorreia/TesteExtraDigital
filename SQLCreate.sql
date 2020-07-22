create table tenderecos
(
  id_endereco int not null,
  cep varchar(6) not null,
  cidade Varchar(20),
  estado char(2),
  num_casa integer,
  bairro varchar(50),
  primary key (id_endereco)
);

create table tpessoas
(
  ID_PESSOA INTEGER NOT NULL,
  NOM_PESSOA VARCHAR(70) NOT NULL,
  IDADE INTEGER,
  DATA_NASC DATE,
  DATA_CADASTRO DATE,
  ID_ENDERECOP INTEGER NOT NULL
);

create table tpesendereco
(
  ID_ENDERECO INTEGER NOT NULL,
  ID_PESSOA INTEGER NOT NULL,
  BOL_ATIVO CHAR(1),
  PRIMARY KEY(ID_ENDERECO, ID_PESSOA)
);


create table tempresas
(
  ID_EMPRESA INTEGER NOT NULL,
  NOM_RAZAO VARCHAR(70) NOT NULL,
  NOM_FANTASIA VARCHAR(70),
  CNPJ VARCHAR(20),
  IE VARCHAR(10),
  PRIMARY KEY(ID_EMPRESA)
);

create table tfuncionarios
(
  ID_FUNCIONARIO INT NOT NULL,
  NOM_FUNCIONARIO VARCHAR(70) NOT NULL,
  DATA_CADASTRO DATE NOT NULL,
  DATA_NASC DATE,
  SALARIO NUMERIC(15,2),
  SEXO CHAR(1),
  ID_ENDERECOP INTEGER NOT NULL,
  PRIMARY KEY(ID_FUNCIONARIO)
);


create table tfuncendereco
(
  ID_ENDERECO INTEGER NOT NULL,
  ID_FUNCIONARIO INTEGER NOT NULL,
  BOL_ATIVO CHAR(1),
  PRIMARY KEY(ID_ENDERECO, ID_FUNCIONARIO)
);




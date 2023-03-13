CREATE DATABASE sprint1;

USE sprint1;

-- TABELAS -- 

CREATE TABLE empresa (
idEmpresa int PRIMARY KEY auto_increment,
RazãoSocial VARCHAR (100) NOT NULL,
NomeEmpresa VARCHAR(50) NOT NULL,
DataCadastro DATE,
CNPJ CHAR(14) NOT NULL,
Endereço VARCHAR(50),
Bairro VARCHAR(50),
CEP CHAR(08) NOT NULL,
Cidade VARCHAR(30),
Estado VARCHAR(30)
);

CREATE TABLE usuário (
idUsuario int PRIMARY KEY auto_increment,
Nome VARCHAR(50) NOT NULL,
Email VARCHAR(30) CONSTRAINT chkEmailusuário CHECK (Email LIKE '%@%') NOT NULL,
DataCadastro DATETIME default current_timestamp
);

CREATE TABLE sensor (
idSensor int PRIMARY KEY auto_increment,
TipoSensor VARCHAR(20),
StatusDoSensor VARCHAR(30) CONSTRAINT chkStatusDoSensor CHECK (StatusDoSensor = 'ativo' OR StatusDoSensor ='inativo' OR StatusDoSensor ='manutenção')
);

CREATE TABLE dadosSensor (
idSensor int PRIMARY KEY auto_increment,
Luminosidade int,
DadosDoSensor int,
DadosHora DATETIME default current_timestamp
);

-- DESCRIBE -- 

DESC empresa;
DESC usuário;
DESC sala;
DESC sensor;
DESC dadosSensor;

-- INSERÇÃO DE DADOS NAS TABELAS EMPRESA E USUÁRIO --

INSERT INTO empresa (RazãoSocial, NomeEmpresa, DataCadastro, CNPJ, Endereço, Bairro, CEP, Cidade, Estado) VALUES 
	('Banco Bradesco BBI S.A.','Bradesco EST UNIF','2023-03-01','60746948000112','Rua Aurora Soares Barbosa, 1081','Vila Campesina','06023010','Osasco','SP'),
    ('Accenture do Brasil LTDA','Accenture','2022-11-22','96534094000158','Rua Alexandre Dumas, 2051','Chacára Santo Antônio','04717916','São Paulo','SP'),
    ('Stefanini Consultoria e Assessoria em Informática S.A.','Stefanini','2023-01-28','58069360002092','Avenida Marginal, 156','Centro','13820000','Jaguariúna','SP'),
    ('Deloitte Touche Tohmatsu Consultores LTDA','Deloitte Consulting','2023-02-09', '02189924000103', 'Avenida Doutor Chucri Zaidan, 1240','Vila São Francisco','04711130','São Paulo','SP'),
    ('Vericode Tecnologia LTDA','Vericode','2023-02-26','05490788000185','Rua Haddock Lobo, 337 - 8 Andar','Cerqueira Cesar','01414901','São paulo','SP');
    
INSERT INTO usuário (Nome, Email) VALUES
	('Lazáro Crispin','lazarocrispim@gmail.com'),
    ('Luciana Veiga','lucianaveiga@outlook.com'),
    ('Juliano Ferreira','lucianoferreira@gmail.com'),
    ('Cristina Almeida','cristina.alemeida@gmail.com'),
    ('Fernando Paz','fernandopaz@outlook.com');
    
INSERT INTO dadosSensor (DadosDoSensor)
	('LDR-5');

-- VISUALIZANDO AS TABELAS COM OS DADOS INSERIDOS -- 

SELECT * FROM Empresa;

SELECT * FROM usuário;

-- SELEÇÃO DE DADOS --

SELECT RazãoSocial, NomeEmpresa, CNPJ FROM empresa ORDER BY RazãoSocial;

SELECT * FROM empresa ORDER BY NomeEmpresa;

SELECT * FROM empresa ORDER BY CNPJ DESC;

SELECT * FROM empresa WHERE RazãoSocial LIKE '_E%';

SELECT Nome FROM usuário;

SELECT Email FROM usuário;

SELECT * FROM usuário ORDER BY Nome;

SELECT * FROM usuário WHERE Nome LIKE '%_A';

SELECT * FROM usuário ORDER BY Email DESC;
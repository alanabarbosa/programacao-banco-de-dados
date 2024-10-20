CREATE DATABASE Loja;

USE Loja;

CREATE TABLE Estado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    UF CHAR(2) NOT NULL
);

CREATE TABLE Municipio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estado_id INT NOT NULL,         
    nome VARCHAR(100) NOT NULL,
    codIBGE CHAR(7) NOT NULL,
    FOREIGN KEY (estado_id) REFERENCES Estado(id) ON DELETE CASCADE,
    CONSTRAINT fk_Municipio_Estado_1_idx FOREIGN KEY (estado_id) REFERENCES Estado(id)
);

CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    celular VARCHAR(15),
    EndLogradouro VARCHAR(255),
    EndNumero VARCHAR(20),
    EndMunicipio VARCHAR(100),
    EndCep VARCHAR(8),
    municipio_id INT,
    FOREIGN KEY (municipio_id) REFERENCES Municipio(id) ON DELETE SET NULL
);

CREATE TABLE ContaReceber (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,      
    FaturaVendaId INT NOT NULL,
    DataConta DATE NOT NULL,
    DataVencimento DATE NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Situacao ENUM('1', '2', '3') NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Cliente(id) ON DELETE CASCADE
);

INSERT INTO Estado (nome, UF) VALUES 
('São Paulo', 'SP'),
('Minas Gerais', 'MG');

INSERT INTO Municipio (estado_id, nome, codIBGE) VALUES
(1, 'São Paulo', '3550308'),
(1, 'Campinas', '3509502'),
(2, 'Belo Horizonte', '3106200');

INSERT INTO Cliente (nome, cpf, celular, EndLogradouro, EndNumero, EndMunicipio, EndCep, municipio_id) VALUES
('João Silva', '12345678901', '11987654321', 'Rua A', '100', 'São Paulo', '01001000', 1),
('Maria Souza', '98765432100', '11923456789', 'Rua B', '200', 'Campinas', '13010000', 2),
('Carlos Oliveira', '11223344556', '11976543210', 'Rua C', '300', 'Belo Horizonte', '30150000', 3);

INSERT INTO ContaReceber (client_id, FaturaVendaId, DataConta, DataVencimento, Valor, Situacao) VALUES
(1, 1, '2024-10-01', '2024-11-01', 100.50, '1'),
(2, 2, '2024-10-02', '2024-11-05', 150.75, '2'),
(3, 3, '2024-10-03', '2024-11-10', 200.00, '1');



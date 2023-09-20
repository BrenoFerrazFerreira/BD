CREATE TABLE Cliente (
    Cod_Cliente NUMBER(8,2) PRIMARY KEY NOT NULL,
    Nome_Cliente VARCHAR2(30),
    Endereco VARCHAR2(30),
    Cidade VARCHAR2(20),
    CEP VARCHAR2(10),
    UF VARCHAR2(2)
);

CREATE TABLE Vendedor (
    Cod_Vendedor NUMBER(8,2) PRIMARY KEY NOT NULL,
    Nome_Vendedor VARCHAR2(30),
    Faixa_Comissao NUMBER(4,2),
    Salario_Fixo NUMBER(7,2)
);

CREATE TABLE Pedido (
    Num_Pedido NUMBER(8,2) PRIMARY KEY NOT NULL,
    Prazo_Entrega DATE,
    Cod_Cliente NUMBER(8,2),
    Cod_Vendedor NUMBER(8,2)
);

CREATE TABLE Produto (
    Cod_Produto NUMBER(8,2) PRIMARY KEY NOT NULL,
    Drescricao VARCHAR2(20),
    Unidade VARCHAR2(2),
    Valor_Unitario NUMBER(6,2)
);

CREATE TABLE Item_Pedido (
    Num_Pedido NUMBER(8,2),
    Cod_Produto NUMBER(8,2),
    Quantidade NUMBER(5)
);

ALTER TABLE Pedido
ADD FOREIGN KEY (Cod_Cliente) REFERENCES Cliente(Cod_Cliente);

ALTER TABLE Pedido
ADD FOREIGN KEY (Cod_Vendedor) REFERENCES Vendedor(Cod_Vendedor);

ALTER TABLE Item_Pedido
ADD FOREIGN KEY (Num_Pedido) REFERENCES Pedido(Num_Pedido);

ALTER TABLE Item_Pedido
ADD FOREIGN KEY (Cod_Produto) REFERENCES Produto(Cod_Produto);

Create table TabLog
(datalog date,
 campo1 varchar2(60),
 campo2 varchar2(60)); 

 Create table Tab_erro
( dataerro date,
 mensagem varchar2(100));

 -- CLIENTES
 -- Inserção 1
INSERT INTO Cliente (Cod_Cliente, Nome_Cliente, Endereco, Cidade, CEP, UF)
VALUES (1, 'João Silva', 'Rua A', 'São Paulo', '12345-678', 'SP');

-- Inserção 2
INSERT INTO Cliente (Cod_Cliente, Nome_Cliente, Endereco, Cidade, CEP, UF)
VALUES (2, 'Maria Santos', 'Avenida B', 'Rio de Janeiro', '54321-876', 'RJ');

-- Inserção 3
INSERT INTO Cliente (Cod_Cliente, Nome_Cliente, Endereco, Cidade, CEP, UF)
VALUES (3, 'Carlos Oliveira', 'Rua C', 'Belo Horizonte', '98765-432', 'MG');

-- Inserção 4
INSERT INTO Cliente (Cod_Cliente, Nome_Cliente, Endereco, Cidade, CEP, UF)
VALUES (4, 'Ana Pereira', 'Rua D', 'Porto Alegre', '23456-789', 'RS');

-- Inserção 5
INSERT INTO Cliente (Cod_Cliente, Nome_Cliente, Endereco, Cidade, CEP, UF)
VALUES (5, 'Pedro Almeida', 'Avenida E', 'Salvador', '87654-321', 'BA');

 -- VENDEDOR
-- Inserção 1
INSERT INTO Vendedor (Cod_Vendedor, Nome_Vendedor, Faixa_Comissao, Salario_Fixo)
VALUES (1, 'José Oliveira', 0.10, 5000.00);

-- Inserção 2
INSERT INTO Vendedor (Cod_Vendedor, Nome_Vendedor, Faixa_Comissao, Salario_Fixo)
VALUES (2, 'Ana Silva', 0.15, 5500.00);

-- Inserção 3
INSERT INTO Vendedor (Cod_Vendedor, Nome_Vendedor, Faixa_Comissao, Salario_Fixo)
VALUES (3, 'Carlos Santos', 0.12, 5200.00);

-- Inserção 4
INSERT INTO Vendedor (Cod_Vendedor, Nome_Vendedor, Faixa_Comissao, Salario_Fixo)
VALUES (4, 'Mariana Pereira', 0.08, 4800.00);

-- Inserção 5
INSERT INTO Vendedor (Cod_Vendedor, Nome_Vendedor, Faixa_Comissao, Salario_Fixo)
VALUES (5, 'Rafaela Almeida', 0.18, 6000.00);

 -- PEDIDO
 -- Inserção 1
INSERT INTO Pedido (Num_Pedido, Prazo_Entrega, Cod_Cliente, Cod_Vendedor)
VALUES (1, TO_DATE('2023-08-25', 'YYYY-MM-DD'), 1, 2);

-- Inserção 2
INSERT INTO Pedido (Num_Pedido, Prazo_Entrega, Cod_Cliente, Cod_Vendedor)
VALUES (2, TO_DATE('2023-08-28', 'YYYY-MM-DD'), 2, 1);

-- Inserção 3
INSERT INTO Pedido (Num_Pedido, Prazo_Entrega, Cod_Cliente, Cod_Vendedor)
VALUES (3, TO_DATE('2023-08-30', 'YYYY-MM-DD'), 3, 4);

-- Inserção 4
INSERT INTO Pedido (Num_Pedido, Prazo_Entrega, Cod_Cliente, Cod_Vendedor)
VALUES (4, TO_DATE('2023-09-02', 'YYYY-MM-DD'), 4, 5);

-- Inserção 5
INSERT INTO Pedido (Num_Pedido, Prazo_Entrega, Cod_Cliente, Cod_Vendedor)
VALUES (5, TO_DATE('2023-09-05', 'YYYY-MM-DD'), 5, 3);

 -- PRODUTO 
-- Inserção 1
INSERT INTO Produto (Cod_Produto, Drescricao, Unidade, Valor_Unitario)
VALUES (1, 'Produto A', 'UN', 50.00);

-- Inserção 2
INSERT INTO Produto (Cod_Produto, Drescricao, Unidade, Valor_Unitario)
VALUES (2, 'Produto B', 'KG', 10.99);

-- Inserção 3
INSERT INTO Produto (Cod_Produto, Drescricao, Unidade, Valor_Unitario)
VALUES (3, 'Produto C', 'LT', 25.50);

-- Inserção 4
INSERT INTO Produto (Cod_Produto, Drescricao, Unidade, Valor_Unitario)
VALUES (4, 'Produto D', 'UN', 30.75);

-- Inserção 5
INSERT INTO Produto (Cod_Produto, Drescricao, Unidade, Valor_Unitario)
VALUES (5, 'Produto E', 'KG', 5.25);

 -- ITEM PEDIDO
 -- Inserção 1
INSERT INTO Item_Pedido (Num_Pedido, Cod_Produto, Quantidade)
VALUES (1, 1, 3);

-- Inserção 2
INSERT INTO Item_Pedido (Num_Pedido, Cod_Produto, Quantidade)
VALUES (1, 2, 2);

-- Inserção 3
INSERT INTO Item_Pedido (Num_Pedido, Cod_Produto, Quantidade)
VALUES (3, 3, 1);

-- Inserção 4
INSERT INTO Item_Pedido (Num_Pedido, Cod_Produto, Quantidade)
VALUES (4, 4, 5);

-- Inserção 5
INSERT INTO Item_Pedido (Num_Pedido, Cod_Produto, Quantidade)
VALUES (5, 5, 10);
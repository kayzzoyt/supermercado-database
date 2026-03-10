CREATE DATABASE Supermercado_Araujo; 
USE Supermercado_Araujo; 
# TABELA DE CLIENTES 
CREATE TABLE tbl_cliente ( 
id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(100) NOT NULL 
); 
# TELEFONE DOS CLIENTES 
CREATE TABLE tbl_cliente_telefone ( 
id_telefone INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    numero VARCHAR(20) NOT NULL, 
    id_cliente INT NOT NULL, 
    CONSTRAINT FK_telefone_cliente_cliente 
    FOREIGN KEY (id_cliente) REFERENCES tbl_cliente(id_cliente) 
); 
 
# ENDEREÇO DOS CLIENTES 
CREATE TABLE tbl_endereco_cliente ( 
    id_endereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    estado VARCHAR(45) NOT NULL, 
    bairro VARCHAR(45) NOT NULL, 
    rua VARCHAR(45) NOT NULL, 
    numero INT NOT NULL, 
    cep VARCHAR(15) NOT NULL, 
    id_cliente INT NOT NULL, 
    CONSTRAINT FK_endereco_cliente_cliente 
    FOREIGN KEY (id_cliente) REFERENCES tbl_cliente(id_cliente) 
); 
 
 
# PEDIDOS REALIZADOS PELOS CLIENTES  
CREATE TABLE tbl_pedido ( 
    id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    numero_pedido INT NOT NULL UNIQUE, 
    data_compra DATE NOT NULL, 
    id_cliente INT NOT NULL, 
    CONSTRAINT FK_pedido_cliente 
    FOREIGN KEY (id_cliente) REFERENCES tbl_cliente(id_cliente) 
); 
 
# COLABORADORES (FUNCIONARIOS) 
CREATE TABLE tbl_colaborador ( 
    id_colaborador INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL, 
    cpf VARCHAR(15) NOT NULL UNIQUE, 
    cargo VARCHAR(45) NOT NULL 
); 
 
# TELEFONE DOS COLABORADORES  
CREATE TABLE tbl_telefone_colaborador ( 
    id_telefone INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    numero VARCHAR(20) NOT NULL, 
    id_colaborador INT NOT NULL, 
    CONSTRAINT FK_telefone_colaborador_colaborador 
    FOREIGN KEY (id_colaborador) REFERENCES tbl_colaborador(id_colaborador) 
); 
 
 
# ENDERECO DOS COLABORADORES 
CREATE TABLE tbl_endereco_colaborador ( 
    id_endereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    estado VARCHAR(45) NOT NULL, 
    bairro VARCHAR(45) NOT NULL, 
    rua VARCHAR(45) NOT NULL, 
    numero INT NOT NULL, 
    cep VARCHAR(15) NOT NULL, 
    id_colaborador INT NOT NULL, 
    CONSTRAINT FK_endereco_colaborador_colaborador 
    FOREIGN KEY (id_colaborador) REFERENCES tbl_colaborador(id_colaborador) 
); 
 
# VENDAS REALIZADAS  
CREATE TABLE tbl_venda ( 
    id_venda INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    id_pedido INT NOT NULL, 
    valor DECIMAL(10,2) NOT NULL, 
    data DATETIME NOT NULL, 
    id_colaborador INT NOT NULL, 
    CONSTRAINT FK_venda_pedido 
    FOREIGN KEY (id_pedido) REFERENCES tbl_pedido(id_pedido), 
    CONSTRAINT FK_venda_colaborador 
    FOREIGN KEY (id_colaborador) REFERENCES tbl_colaborador(id_colaborador) 
); 
 
# PRODUTOS 
CREATE TABLE tbl_produto ( 
    id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    cod_produto VARCHAR(50) NOT NULL UNIQUE, 
    descricao TEXT NOT NULL, 
    quantidade INT NOT NULL 
); 
 
# ESTOQUE DOS PRODUTOS  
CREATE TABLE tbl_estoque ( 
    id_estoque INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    quantidade_produtos INT NOT NULL, 
    data_ultima_atualizacao DATETIME NOT NULL, 
    id_produto INT NOT NULL UNIQUE, 
    CONSTRAINT FK_estoque_produto 
    FOREIGN KEY (id_produto) REFERENCES tbl_produto(id_produto) 
); 
 
 
# RELACIONAMENTO ENTRE PEDIDOS E PRODUTOS  
CREATE TABLE tbl_pedido_produto ( 
    id_pedido_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    id_pedido INT NOT NULL, 
    id_produto INT NOT NULL, 
    CONSTRAINT FK_pedido_produto_pedido 
    FOREIGN KEY (id_pedido) REFERENCES tbl_pedido(id_pedido), 
    CONSTRAINT FK_pedido_produto_produto 
    FOREIGN KEY (id_produto) REFERENCES tbl_produto(id_produto) 
); 
 
# RELACIONAMENTO ENTRE PRODUTOS E VENDAS  
CREATE TABLE tbl_produto_venda ( 
    id_produto_venda INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    id_produto INT NOT NULL, 
    id_venda INT NOT NULL, 
    CONSTRAINT FK_produto_venda_produto 
    FOREIGN KEY (id_produto) REFERENCES tbl_produto(id_produto), 
    CONSTRAINT FK_produto_venda_venda 
    FOREIGN KEY (id_venda) REFERENCES tbl_venda(id_venda) 
); 
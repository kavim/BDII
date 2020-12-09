DROP DATABASE  IF EXISTS trigger_db_example; 
CREATE DATABASE  IF NOT EXISTS trigger_db_example; 
USE trigger_db_example;

CREATE TABLE `clientes` (
  `Id` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Endereco` varchar(200) NOT NULL,
  `Telefone` varchar(20) NOT NULL,
  `TotalVendido` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`)
);

INSERT INTO `clientes` VALUES (1,'Juan Acosta','Alberto Diamante 2211','55-550096664',0.00),(2,'Marcio Castro','Castro 3344','55-99887747',0.00);

trigger_db_example
CREATE TABLE `vendas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Total` decimal(18,2) NOT NULL,
  `Clientes_Id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Vendas_Clientes_idx` (`Clientes_Id`),
  CONSTRAINT `fk_Vendas_Clientes` FOREIGN KEY (`Clientes_Id`) REFERENCES `clientes` (`Id`)
) ;


CREATE TABLE `it_vendas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome_do_produto` VARCHAR(100) NOT NULL,
  `preco` decimal(18,2),
  `Valor_total_item` decimal(18,2) NOT NULL,
  `Venda_Id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_venda_id` (`Venda_Id`),
  CONSTRAINT `fk_venda_id` FOREIGN KEY (`Venda_Id`) REFERENCES `vendas` (`Id`)
);


DELIMITER ;;
CREATE  TRIGGER vendas_AFTER_INSERT AFTER INSERT ON `vendas` FOR EACH ROW BEGIN
 
 update clientes set clientes.TotalVendido = clientes.TotalVendido + new.Total WHERE clientes.Id = new.Clientes_Id;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE TRIGGER vendas_AFTER_UPDATE AFTER UPDATE ON `vendas` FOR EACH ROW BEGIN

update clientes set clientes.TotalVendido = clientes.TotalVendido - old.Total WHERE clientes.Id = old.Clientes_Id;

update clientes set clientes.TotalVendido = clientes.TotalVendido + new.Total WHERE clientes.Id = new.Clientes_Id;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE TRIGGER vendas_BEFORE_DELETE BEFORE DELETE ON `vendas` FOR EACH ROW BEGIN
update clientes set clientes.TotalVendido = clientes.TotalVendido - old.Total WHERE clientes.Id = old.Clientes_Id;
END ;;
DELIMITER ;


/* tigger para itVendas */


DELIMITER ;;
CREATE  TRIGGER it_vendas_AFTER_INSERT AFTER INSERT ON `it_vendas` FOR EACH ROW BEGIN
 
 update vendas set vendas.Total = vendas.Total + new.Valor_total_item WHERE vendas.Id = new.Venda_Id;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE TRIGGER it_vendas_AFTER_UPDATE AFTER UPDATE ON `it_vendas` FOR EACH ROW BEGIN

update vendas set vendas.Total = vendas.Total - old.Valor_total_item WHERE vendas.Id = old.Venda_Id;

update vendas set vendas.Total = vendas.Total + new.Valor_total_item WHERE vendas.Id = new.Venda_Id;

END ;;
DELIMITER ;

DELIMITER ;;
DROP TRIGGER IF EXISTS it_vendas_BEFORE_DELETE;
CREATE TRIGGER it_vendas_BEFORE_DELETE BEFORE DELETE ON `it_vendas` FOR EACH ROW BEGIN
	
	update vendas set vendas.Total = vendas.Total - old.Valor_total_item WHERE vendas.Id = old.Venda_Id;

END ;;
DELIMITER ;


/* criando storeProcedure para it_venda */

DELIMITER $$ 
CREATE PROCEDURE sp_total_de_itens_vendidos_por_cliente()
BEGIN 
    	SELECT clientes.Nome, COUNT(it_vendas.Id) FROM clientes
		INNER JOIN vendas ON vendas.Clientes_Id = clientes.Id
		INNER	JOIN it_vendas ON it_vendas.Venda_Id = vendas.Id
		GROUP BY clientes.Id;    
END$$ 
DELIMITER ;

DELIMITER $$ 
DROP PROCEDURE IF EXISTS sp_deletar_venda;
CREATE PROCEDURE sp_deletar_venda(IN venda_id_IN INT)
BEGIN 
	    
    DELETE FROM it_vendas WHERE it_vendas.Venda_Id = venda_id_IN;

    DELETE FROM vendas WHERE vendas.Id = venda_id_IN;
    
END$$ 
DELIMITER ;

# Executando as SPs

SET @venda_id = 10;
SELECT @venda_id;

CALL sp_deletar_venda(@venda_id);
CALL sp_total_de_itens_vendidos_por_cliente();

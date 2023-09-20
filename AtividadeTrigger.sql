/*trigger 1*/
CREATE OR REPLACE TRIGGER VerificaPedido  
BEFORE INSERT ON Item_Pedido  
FOR EACH ROW  
DECLARE   
  v_NumPedido NUMBER(8); 
  v_Cod NUMBER(8,2); 
BEGIN    
  SELECT Cod_Cliente INTO v_Cod FROM Pedido 
  WHERE Num_Pedido = :NEW.Num_Pedido;
  SELECT COUNT(Cod_Cliente) INTO v_NumPedido  FROM Pedido  
  WHERE Cod_Cliente = v_Cod  
  AND TO_CHAR(Prazo_Entrega, 'YYYY-MM') = TO_CHAR( SYSDATE, 'YYYY-MM' );  
  IF v_NumPedido >= 2  
  THEN  
    :NEW.Valor := :NEW.Valor - (:NEW.Valor * 0.15);   
  END IF;  
END;

INSERT INTO Pedido (Num_Pedido, Prazo_Entrega, Cod_Cliente, Cod_Vendedor) 
VALUES (9, TO_DATE('2023-09-26', 'YYYY-MM-DD'), 1, 2);
INSERT INTO Item_Pedido (Num_Pedido, Cod_Produto, Quantidade, Valor)  
VALUES (9, 1, 3, 10);

select * from pedido;
select * from item_pedido;

/*trigger 2*/
CREATE OR REPLACE TRIGGER tr_Endereco 
BEFORE UPDATE OF Endereco ON Cliente
FOR EACH ROW
BEGIN 
  INSERT INTO TabLog (datalog,campo1,campo2) VALUES(TO_DATE( SYSDATE, 'YYYY-MM-DD'), 
  'Observar mudança de endereço ' || :OLD.Cod_Cliente || ' ' || :OLD.Endereco,
  'Observar mudança de endereço ' || :NEW.Cod_Cliente || ' ' || :NEW.Endereco);
END;

UPDATE Cliente 
SET Endereco = 'teste'
WHERE Cod_Cliente = 1;

SELECT * FROM TabLog;

/*trigger 3*/
ALTER TABLE Produto
ADD Quantidade NUMBER(5);

SELECT * FROM Produto;

UPDATE Produto
SET Quantidade = 10
WHERE Valor_Unitario > 1;

CREATE OR REPLACE TRIGGER Verifica_Quantidade 
BEFORE INSERT ON Item_Pedido
FOR EACH ROW
DECLARE
    v_Quantidade NUMBER(8);
BEGIN 
    SELECT Quantidade INTO v_Quantidade 
    FROM Produto
    WHERE Cod_Produto = :NEW.Cod_Produto;

    IF :NEW.Quantidade <= v_Quantidade
    THEN
        UPDATE Produto
        SET Quantidade = Quantidade - :NEW.Quantidade
        WHERE Cod_Produto = :NEW.Cod_Produto;
    END IF;
    IF :NEW.Quantidade > v_Quantidade
    THEN 
        :NEW.Quantidade := v_Quantidade;
        UPDATE Item_Pedido
        SET Quantidade = 0
        WHERE Num_Pedido = :NEW.Num_Pedido;
    END IF;
    IF v_Quantidade = 0
    THEN 
      RAISE_APPLICATION_ERROR(-20400,'Update não permitido');
    END IF;
END;

INSERT INTO Pedido (Num_Pedido, Prazo_Entrega, Cod_Cliente, Cod_Vendedor) 
VALUES (10, TO_DATE('2023-09-29', 'YYYY-MM-DD'), 1, 2);
INSERT INTO Item_Pedido (Num_Pedido, Cod_Produto, Quantidade, Valor)  
VALUES (10, 1, 3, 10);

SELECT * FROM PRODUTO;

/*trigger 4*/
CREATE OR REPLACE TRIGGER Verifica_Prazo
BEFORE INSERT OR UPDATE OF Prazo_Entrega ON Pedido
FOR EACH ROW
DECLARE
    v_Data NUMBER(5);
BEGIN 
    v_Data := TO_NUMBER(TO_CHAR(SYSDATE, 'DD')) - TO_NUMBER(TO_CHAR(:NEW.Prazo_Entrega, 'DD'));
    IF v_Data > 5
    THEN 
      :NEW.Prazo_Entrega := TO_DATE(:NEW.Prazo_Entrega, 'DD') + 5;
    END IF;
END;

UPDATE Pedido
SET Prazo_Entrega = TO_DATE(SYSDATE, 'YYYY-MM-DD')
WHERE Num_Pedido = 3;

SELECT * FROM Pedido;
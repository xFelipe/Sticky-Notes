

 SELECT * FROM tdesconto
  ORDER BY CLASSE;

 INSERT INTO tdesconto
 VALUES ('P', 95, 99);
 
 
 
 SELECT * FROM TDESCONTO
 WHERE upper(CLASSE) = upper('&CLA');
 
 
 update tdesconto set
 inferior = &inf,
 superior = &sup
 where classe = '&class';


DELETE FROM TDESCONTO
WHERE CLASSE = '&CLA';


-------------------------
--Criação de tabela teste
-------------------------

CREATE TABLE TDESCONTO2
 AS SELECT * FROM TDESCONTO;
 
 SELECT * FROM TDESCONTO2;
 
 commit;
 
 delete from tdesconto2;
 
 rollback;
 
 truncate table tdesconto2;
 
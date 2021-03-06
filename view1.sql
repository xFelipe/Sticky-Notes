--Cria��o e uso simples de view simples

CREATE OR REPLACE VIEW V_ALUNO
AS
    SELECT COD_ALUNO AS CODIGO, SALARIO,
           NOME AS ALUNO, CIDADE
    FROM TALUNO
    WHERE ESTADO = 'RS';
    
SELECT * FROM V_ALUNO
ORDER BY ALUNO;



CREATE OR REPLACE VIEW V_CONTRATO_TOP
AS
    SELECT COD_CONTRATO, DESCONTO
    FROM TCONTRATO
    WHERE DESCONTO>=10;
    
SELECT * FROM V_CONTRATO_TOP;


--Ver views dispon�veis
SELECT VIEW_NAME, TEXT FROM USER_VIEWS;
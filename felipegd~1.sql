--Formatação de data

--Conversor to-char(data, formato)
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') AS DATA FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD/MM') DIA_MES FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD') DIA FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MM') MES FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY') ANO FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'yy') ano from dual;
--
SELECT TO_CHAR(SYSDATE,'MONTH') MES_ESCRITO FROM DUAL;
--DIA DA SEMANA EM NÚMERO
SELECT TO_CHAR(SYSDATE, 'D') FROM DUAL;  --4
--
SELECT TO_CHAR(SYSDATE, 'DY') FROM DUAL; --QUA

SELECT TO_CHAR(SYSDATE, 'DAY')FROM DUAL; --QUARTA
--
SELECT TO_CHAR(SYSDATE, 'YEAR') FROM DUAL; --ANO EM INGLES
--fm serve pra não pedir espaço de mais
SELECT TO_CHAR(SYSDATE, '"NOVO HAMBURGO", fmDAY"," DD "de" fmMONTH "de" YYYY') from dual;

--EXTRAÇÃO DE HORA-MIN-SEG
SELECT TO_CHAR(SYSDATE, 'HH24:MI') HORA_MIN FROM DUAL;
--
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') HORA_MIN_SEG FROM DUAL;
--
SELECT TO_CHAR(SYSDATE, 'DD/MM HH24:MI') FROM DUAL;
--
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') FROM DUAL;



--L ->R$
--G ->ponto
--D ->casas decimais

SELECT * FROM TALUNO;
--Trim: retira espaços em branco
SELECT TO_CHAR(Salario, 'L99999.99') SALARIO1, TRIM(TO_CHAR(SALARIO, 'L99G999D99')) SALARIO2
FROM TALUNO;

--
SELECT 'R$ '||(ROUND(SALARIO,2)) AS SALARIO FROM TALUNO;
SELECT * FROM TALUNO;

----
--NVL e NVL2
select * from tcontrato;

SELECT Total,
       Desconto,
       Desconto+Total,
       NVL(Desconto, 0) as "nvl+desconto", --Se desconto for nulo, retorna 0
       NVL(Desconto, 0)+TOTAL as "nvl+total",
       NVL2(DESCONTO, total, -1) as nvl2 --Se desconto for nulo, retorna -1. Se não retorna total
FROM TCONTRATO;

--       
SELECT * FROM TALUNO;

UPDATE TALUNO SET
NOME = NULL
WHERE COD_ALUNO = 5;
--
SELECT COD_ALUNO, NVL(NOME, 'SEM NOME') FROM TALUNO;
ROLLBACK;

UPDATE TALUNO SET
ESTADO = 'SC'
WHERE COD_ALUNO = 4;

UPDATE TALUNO SET
ESTADO = 'RJ'
WHERE COD_ALUNO =5;

--CASE
SELECT NOME, ESTADO,
        CASE
            WHEN ESTADO = 'RS' THEN 'GAUCHO'
            WHEN ESTADO = 'AC' THEN 'ACREANO'
            WHEN ESTADO = 'RJ' AND SALARIO>500 THEN 'CARIOCA'
            ELSE 'OUTROS'
        END AS APELIDO
FROM TALUNO;

--DECODE similar ao case, mas com menos comandos e menos claro
SELECT NOME, ESTADO,
        DECODE(ESTADO, 'RS', 'GAUCHO',
                       'AC', 'ACREANO',
                       'RJ', 'CARIOCA',
                             'OUTROS') AS APELIDO
FROM TALUNO;
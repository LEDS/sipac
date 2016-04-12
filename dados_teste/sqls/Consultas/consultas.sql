/*
	Nesse SQL, são utilizados os seguintes parâmetros:
		- Região: Especifica o tipo de região, ou seja, se é por Estado, Mesorregião, Microrregião ou Município. Em outras palavras, especifica a coluna do tipo região.
		- regiao_escolhida: Especifica o atributo da coluna de acordo com a Região. (Ex.: Se Região for Mesorregião, a regiao_escolhida pode ser: Central, Litoral, Noroeste ou Sul.)
*/

-- HISTORIAS 1, 2, 3, 4, 7, 15, 16, 17, 18, 19, 20 / PRODUTO OU GRUPO DE PRODUTO / REGIÃO

SELECT
producao.ano AS ANO,
producao.mes AS MES,

CASE WHEN ${pg_param}='Grupo' THEN grupo.nome_grupo
	WHEN ${pg_param}='Produto' THEN produto.nome
END AS PG_NOME,

CASE WHEN ${regiao}='Estado' THEN estado.nome
	WHEN ${regiao}='Mesorregião' THEN mesorregiao.nome
	WHEN ${regiao}='Microrregião' THEN microrregiao.nome
	WHEN ${regiao}='Município' THEN municipio.nome
END AS REGIAO_NOME,

SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_plantada ELSE 0 END) AS AREA_PLANTADA_NAO_IRRIGADO,
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_plantada ELSE 0 END) AS AREA_PLANTADA_IRRIGADO,
SUM(producao.area_plantada) AS AREA_PLANTADA_TOTAL,
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_colhida ELSE 0 END) AS AREA_COLHIDA_NAO_IRRIGADO,
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_colhida ELSE 0 END) AS AREA_COLHIDA_IRRIGADO,
SUM(producao.area_colhida) AS AREA_COLHIDA_TOTAL,
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.producao ELSE 0 END) AS PRODUCAO_NAO_IRRIGADO,
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.producao ELSE 0 END) AS PRODUCAO_IRRIGADO,
SUM(producao.producao) AS PRODUCAO_TOTAL,
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_em_formacao ELSE 0 END) AS AREA_FORMACAO_NAO_IRRIGADO,
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_em_formacao ELSE 0 END) AS AREA_FORMACAO_IRRIGADO,
SUM(producao.area_em_formacao) AS AREA_FORMACAO,
(SUM(producao.area_em_formacao) + SUM(producao.area_plantada)) AS AREA_TOTAL,
SUM(CASE WHEN producao.area_colhida != 0 THEN producao.producao*1000/producao.area_colhida ELSE 0 END) AS RENDIMENTO_MEDIO

FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
INNER JOIN core_estado AS estado ON municipio.estado_id = estado.id
INNER JOIN core_microregiao AS microrregiao ON microrregiao.id = municipio.microregiao_id
INNER JOIN core_mesoregiao AS mesorregiao ON mesorregiao.id = microrregiao.mesoregiao_id

WHERE
CASE WHEN ${regiao}='Estado' THEN estado.nome
	WHEN ${regiao}='Mesorregião' THEN mesorregiao.nome
	WHEN ${regiao}='Microrregião' THEN microrregiao.nome
	WHEN ${regiao}='Município' THEN municipio.nome
END IN (${regiao_escolhida})

GROUP BY producao.mes, producao.ano, REGIAO_NOME, PG_NOME
ORDER BY PG_NOME;


-- FIM   HISTORIAS 1, 2, 3, 4, 7, 15, 16, 17, 18, 19, 20 / PRODUTO OU GRUPO DE PRODUTO / REGIÃO --

--Calculando o Percental de um produto sob a produção do estado no ano de 2015

SELECT
produto.nome AS produto,
SUM(producao.producao) AS producao,
(Select SUM(producaox.producao) from agricultura_producao as producaox where producaox.ano=2015) AS total,

(SUM(producao.producao *100.0/ (Select SUM(producaox.producao) from agricultura_producao as producaox where producaox.ano=2015)
)) AS percentual

FROM core_municipio AS municipio
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
INNER JOIN agricultura_produto AS produto ON producao.produto_id = produto.id
WHERE
producao.area_colhida != 0 AND
producao.ano = 2015
GROUP BY produto.nome;



-- HISTORIAS 8, 10, 11, 12, 13, 14 / GRUPO DE PRODUTOS E PRODUTOS
-- GRUPO DE PRODUTO OU GRUPO DE PRODUTOS/REGIÃO
-- Ambos irrigados e não Irrigados


SELECT DISTINCT

CASE WHEN ${pg_param}='Grupo' THEN grupo.nome_grupo
	WHEN ${pg_param}='Produto' THEN produto.nome
END AS PG_NOME,

CASE WHEN ${regiao}='Estado' THEN estado.nome
	WHEN ${regiao}='Mesorregião' THEN mesorregiao.nome
	WHEN ${regiao}='Microrregião' THEN microrregiao.nome
	WHEN ${regiao}='Município' THEN municipio.nome
END AS REGIAO_NOME,

SUM(valida_sc(${escolhaDoAno1}, producao.ano, 'N', producao.irrigado, producao.area_colhida)) AS AREA_COLHIDA_ANTERIOR_NAO_IRRIGADO,
SUM(valida_sc(${escolhaDoAno1}, producao.ano, 'S', producao.irrigado, producao.area_colhida)) AS AREA_COLHIDA_ANTERIOR_IRRIGADO,
SUM(valida_valor(${escolhaDoAno1}, producao.ano, producao.area_colhida)) AS AREA_COLHIDA_ANTERIOR_TOTAL,
SUM(valida_sc(${escolhaDoAno1}, producao.ano, 'N', producao.irrigado, producao.producao)) AS PRODUCAO_ANTERIOR_NAO_IRRIGADO,
SUM(valida_sc(${escolhaDoAno1}, producao.ano, 'S', producao.irrigado, producao.producao)) AS PRODUCAO_ANTERIOR_IRRIGADO,
SUM(valida_valor(${escolhaDoAno1}, producao.ano, producao.producao)) AS PRODUCAO_ANTERIOR_TOTAL,
SUM(rendimento_medio_sc(${escolhaDoAno1}, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)) AS RENDIMENTO_MEDIO_ANTERIOR_NAO_IRRIGADO,
SUM(rendimento_medio_sc(${escolhaDoAno1}, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)) AS RENDIMENTO_MEDIO_ANTERIOR_IRRIGADO,
SUM(rendimento_medio(${escolhaDoAno1}, producao.ano, producao.area_colhida, producao.producao)) AS RENDIMENTO_MEDIO_ANTERIOR_TOTAL,


SUM(valida_sc(${escolhaDoAno2}, producao.ano, 'N', producao.irrigado, producao.area_colhida)) AS AREA_COLHIDA_ATUAL_NAO_IRRIGADO,
SUM(valida_sc(${escolhaDoAno2}, producao.ano, 'S', producao.irrigado, producao.area_colhida)) AS AREA_COLHIDA_ATUAL_IRRIGADO,
SUM(valida_valor(${escolhaDoAno2}, producao.ano, producao.area_colhida)) AS AREA_COLHIDA_ATUAL_TOTAL,
SUM(valida_sc(${escolhaDoAno2}, producao.ano, 'N', producao.irrigado, producao.producao)) AS PRODUCAO_ATUAL_NAO_IRRIGADO,
SUM(valida_sc(${escolhaDoAno2}, producao.ano, 'S', producao.irrigado, producao.producao)) AS PRODUCAO_ATUAL_IRRIGADO,
SUM(valida_valor(${escolhaDoAno2}, producao.ano, producao.producao)) AS PRODUCAO_ATUAL_TOTAL,
SUM(rendimento_medio_sc(${escolhaDoAno2}, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)) AS RENDIMENTO_MEDIO_ATUAL_NAO_IRRIGADO,
SUM(rendimento_medio_sc(${escolhaDoAno2}, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)) AS RENDIMENTO_MEDIO_ATUAL_IRRIGADO,
SUM(rendimento_medio(${escolhaDoAno2}, producao.ano, producao.area_colhida, producao.producao)) AS RENDIMENTO_MEDIO_ATUAL_TOTAL,


-- Variação Não Irrigado

variacao_p(SUM(valida_sc(${escolhaDoAno1}, producao.ano, 'N', producao.irrigado, producao.area_colhida)),
SUM(valida_sc(${escolhaDoAno2}, producao.ano, 'N', producao.irrigado, producao.area_colhida))) AS VARIACAO_AREA_COLHIDA_NAO_IRRIGADO,

variacao_p(SUM(valida_sc(${escolhaDoAno1}, producao.ano, 'N', producao.irrigado, producao.producao)),
SUM(valida_sc(${escolhaDoAno2}, producao.ano, 'N', producao.irrigado, producao.producao))) AS VARIACAO_PRODUCAO_NAO_IRRIGADO,

variacao_p(SUM(rendimento_medio_sc(${escolhaDoAno1}, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)),
SUM(rendimento_medio_sc(${escolhaDoAno2}, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao))) AS VARIACAO_RENDIMENTO_NAO_IRRIGADO,

-- Fim Variação Não Irrigado


-- Variação Irrigado

variacao_p(SUM(valida_sc(${escolhaDoAno1}, producao.ano, 'S', producao.irrigado, producao.area_colhida)),
SUM(valida_sc(${escolhaDoAno2}, producao.ano, 'S', producao.irrigado, producao.area_colhida))) AS VARIACAO_AREA_COLHIDA_IRRIGADO,

variacao_p(SUM(valida_sc(${escolhaDoAno1}, producao.ano, 'S', producao.irrigado, producao.producao)),
SUM(valida_sc(${escolhaDoAno2}, producao.ano, 'S', producao.irrigado, producao.producao))) AS VARIACAO_PRODUCAO_IRRIGADO,

variacao_p(SUM(rendimento_medio_sc(${escolhaDoAno1}, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)),
SUM(rendimento_medio_sc(${escolhaDoAno2}, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao))) AS VARIACAO_RENDIMENTO_MEDIO_IRRIGADO,

-- Fim Variação Irrigado



-- Variação Total
variacao_p(SUM(valida_valor(${escolhaDoAno1}, producao.ano, producao.area_colhida)),
SUM(valida_valor(${escolhaDoAno2}, producao.ano, producao.area_colhida))) AS VARIACAO_AREA_COLHIDA,

variacao_p(SUM(valida_valor(${escolhaDoAno1}, producao.ano, producao.producao)),
SUM(valida_valor(${escolhaDoAno2}, producao.ano, producao.producao))) AS VARIACAO_PRODUCAO,

variacao_p(SUM(rendimento_medio(${escolhaDoAno1}, producao.ano, producao.area_colhida, producao.producao)),
SUM(rendimento_medio(${escolhaDoAno2}, producao.ano, producao.area_colhida, producao.producao))) AS VARIACAO_RENDIMENTO

-- Fim Variação Total


FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN agricultura_grupo AS grupo ON produto.grupo_id = grupo.id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
INNER JOIN core_estado AS estado ON municipio.estado_id = estado.id
INNER JOIN core_microregiao AS microrregiao ON microrregiao.id = municipio.microregiao_id
INNER JOIN core_mesoregiao AS mesorregiao ON mesorregiao.id = microrregiao.mesoregiao_id

WHERE
CASE WHEN ${regiao}='Estado' THEN estado.nome
	WHEN ${regiao}='Mesorregião' THEN mesorregiao.nome
	WHEN ${regiao}='Microrregião' THEN microrregiao.nome
	WHEN ${regiao}='Município' THEN municipio.nome
END IN (${regiao_escolhida})

GROUP BY REGIAO_NOME, PG_NOME
ORDER BY PG_NOME;

-- Fim     HISTORIAS 8, 10, 11, 12, 13, 14 / GRUPO DE PRODUTOS E PRODUTOS






-- FUNÇÕES PARA CALCULAR A VARIAÇÃO PERCENTUAL --

-- Função valida um determinado valor passado como parâmetro a partir da comparação entre dois anos.
CREATE OR REPLACE FUNCTION valida_valor(ANO_FIX INT, ANO INT, valor INT) RETURNS INTEGER AS $$
BEGIN
	RETURN CASE WHEN ANO_FIX = ANO THEN valor ELSE 0 END;
END
$$ LANGUAGE plpgsql;

-- Função que valida o sistema de cultivo.
CREATE OR REPLACE FUNCTION valida_sc(ANO_FIX INT, ANO INT, SC_FIX CHAR, SC character varying(2), valor INT) RETURNS INTEGER AS $$
BEGIN
	RETURN CASE WHEN ANO_FIX = ANO AND SC_FIX = SC THEN valor ELSE 0 END;
END
$$ LANGUAGE plpgsql;


-- Calcula o rendimento médio caso a comparação entre dois anos seja verdadeira.
CREATE OR REPLACE FUNCTION rendimento_medio(ANO_FIX INT, ANO INT, area_colhida INT, producao INT) RETURNS INTEGER AS $$
BEGIN
	RETURN CASE WHEN ANO_FIX = ANO AND area_colhida!= 0 THEN producao*1000/area_colhida ELSE 0 END;
END
$$ LANGUAGE plpgsql;

-- Calcula o rendimento médio caso a comparação entre dois anos e dois sistemas de cultivo seja verdadeira.
CREATE OR REPLACE FUNCTION rendimento_medio_sc(ANO_FIX INT, ANO INT, SC_FIX CHAR, SC character varying(2), area_colhida INT, producao INT) RETURNS INTEGER AS $$
BEGIN
	RETURN CASE WHEN ANO_FIX = ANO AND area_colhida!= 0 AND SC_FIX = SC THEN producao*1000/area_colhida ELSE 0 END;
END
$$ LANGUAGE plpgsql;

-- Calcula a variação percentual entre dois valores.
CREATE OR REPLACE FUNCTION variacao_p(VALOR_ANTIGO BIGINT, VALOR_RECENTE BIGINT) RETURNS FLOAT AS $$
BEGIN
	RETURN CASE WHEN CAST(VALOR_ANTIGO AS FLOAT) != 0 THEN ((CAST(VALOR_RECENTE AS FLOAT) - CAST(VALOR_ANTIGO AS FLOAT)) / CAST(VALOR_ANTIGO AS FLOAT)) * 100ELSE 0 END;
END
$$ LANGUAGE plpgsql;

--DROP FUNCTION variacao_p(BIGINT, BIGINT);

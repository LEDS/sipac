/*
	Nesse SQL, são utilizados os seguintes parâmetros:
		- Região: Especifica o tipo de região, ou seja, se é por Estado, Mesorregião, Microrregião ou Município. Em outras palavras, especifica a coluna do tipo região.
		- regiao_escolhida: Especifica o atributo da coluna de acordo com a Região. (Ex.: Se Região for Mesorregião, a regiao_escolhida pode ser: Central, Litoral, Noroeste ou Sul.)
*/

-- HISTORIAS 1, 2, 3, 4, 7, 15, 16, 17, 18, 19, 20 / PRODUTO OU GRUPO DE PRODUTO / REGIÃO

SELECT
producao.ano AS ANO,

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
CASE WHEN SUM(producao.area_colhida) != 0 THEN SUM(producao.producao)*1000/SUM(producao.area_colhida) ELSE 0 END AS RENDIMENTO_MEDIO
SUM(producao.area_plantada) - SUM(producao.area_colhida) AS AREA_PERDIDA

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
AND
producao.nome IN (${escolha_do_ano})

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


SELECT

CASE WHEN ${pg_param}='Grupo' THEN grupo.nome_grupo
	WHEN ${pg_param}='Produto' THEN produto.nome
END AS PG_NOME,

CASE WHEN ${regiao}='Estado' THEN estado.nome
	WHEN ${regiao}='Mesorregião' THEN mesorregiao.nome
	WHEN ${regiao}='Microrregião' THEN microrregiao.nome
	WHEN ${regiao}='Município' THEN municipio.nome
END AS REGIAO_NOME,


-- Realiza o somatório de área colhida para não irrigado, irrigado e o total (irrigado + não irrigado) respectivamente, para um determinado ano.
SUM(valida_sc(${escolha_do_ano_1}, producao.ano, 'N', producao.irrigado, producao.area_colhida)) AS AREA_COLHIDA_ANTERIOR_NAO_IRRIGADO,
SUM(valida_sc(${escolha_do_ano_1}, producao.ano, 'S', producao.irrigado, producao.area_colhida)) AS AREA_COLHIDA_ANTERIOR_IRRIGADO,
SUM(valida_valor(${escolha_do_ano_1}, producao.ano, producao.area_colhida)) AS AREA_COLHIDA_ANTERIOR_TOTAL,


-- Realiza o somatório da produção para não irrigado, irrigado e o total (irrigado + não irrigado) respectivamente, para um determinado ano.
SUM(valida_sc(${escolha_do_ano_1}, producao.ano, 'N', producao.irrigado, producao.producao)) AS PRODUCAO_ANTERIOR_NAO_IRRIGADO,
SUM(valida_sc(${escolha_do_ano_1}, producao.ano, 'S', producao.irrigado, producao.producao)) AS PRODUCAO_ANTERIOR_IRRIGADO,
SUM(valida_valor(${escolha_do_ano_1}, producao.ano, producao.producao)) AS PRODUCAO_ANTERIOR_TOTAL,


-- Realiza o cálculo do rendimento médio para não irrigado, irrigado e o total (irrigado + não irrigado) respectivamente, para um determinado ano.
rendimento_medio(
	SUM(CASE WHEN ${escolha_do_ano_1} = producao.ano AND 'N' = producao.irrigado THEN producao.area_colhida ELSE 0 END),
	SUM(CASE WHEN ${escolha_do_ano_1} = producao.ano AND 'N' = producao.irrigado THEN producao.producao ELSE 0 END)
) AS RENDIMENTO_MEDIO_ANTERIOR_NAO_IRRIGADO,

rendimento_medio(
	SUM(CASE WHEN ${escolha_do_ano_1} = producao.ano AND 'S' = producao.irrigado THEN producao.area_colhida ELSE 0 END),
	SUM(CASE WHEN ${escolha_do_ano_1} = producao.ano AND 'S' = producao.irrigado THEN producao.producao ELSE 0 END)
) AS RENDIMENTO_MEDIO_ANTERIOR_IRRIGADO,

rendimento_medio(
	SUM(CASE WHEN ${escolha_do_ano_1} = producao.ano THEN producao.area_colhida ELSE 0 END),
	SUM(CASE WHEN ${escolha_do_ano_1} = producao.ano THEN producao.producao ELSE 0 END)
) AS RENDIMENTO_MEDIO_ANTERIOR_TOTAL,




-- Realiza o somatório de área colhida para não irrigado, irrigado e o total (irrigado + não irrigado) respectivamente, para um determinado ano.
SUM(valida_sc(${escolha_do_ano_2}, producao.ano, 'N', producao.irrigado, producao.area_colhida)) AS AREA_COLHIDA_ATUAL_NAO_IRRIGADO,
SUM(valida_sc(${escolha_do_ano_2}, producao.ano, 'S', producao.irrigado, producao.area_colhida)) AS AREA_COLHIDA_ATUAL_IRRIGADO,
SUM(valida_valor(${escolha_do_ano_2}, producao.ano, producao.area_colhida)) AS AREA_COLHIDA_ATUAL_TOTAL,


-- Realiza o somatório de produção para não irrigado, irrigado e o total (irrigado + não irrigado) respectivamente, para um determinado ano.
SUM(valida_sc(${escolha_do_ano_2}, producao.ano, 'N', producao.irrigado, producao.producao)) AS PRODUCAO_ATUAL_NAO_IRRIGADO,
SUM(valida_sc(${escolha_do_ano_2}, producao.ano, 'S', producao.irrigado, producao.producao)) AS PRODUCAO_ATUAL_IRRIGADO,
SUM(valida_valor(${escolha_do_ano_2}, producao.ano, producao.producao)) AS PRODUCAO_ATUAL_TOTAL,


-- Realiza o cálculo do rendimento médio para não irrigado, irrigado e o total (irrigado + não irrigado) respectivamente, para um determinado ano.
-- Realiza o cálculo do rendimento médio para não irrigado, irrigado e o total (irrigado + não irrigado) respectivamente, para um determinado ano.
rendimento_medio(
	SUM(CASE WHEN ${escolha_do_ano_2} = producao.ano AND 'N' = producao.irrigado THEN producao.area_colhida ELSE 0 END),
	SUM(CASE WHEN ${escolha_do_ano_2} = producao.ano AND 'N' = producao.irrigado THEN producao.producao ELSE 0 END)
) AS RENDIMENTO_MEDIO_ATUAL_NAO_IRRIGADO,

rendimento_medio(
	SUM(CASE WHEN ${escolha_do_ano_2} = producao.ano AND 'S' = producao.irrigado THEN producao.area_colhida ELSE 0 END),
	SUM(CASE WHEN ${escolha_do_ano_2} = producao.ano AND 'S' = producao.irrigado THEN producao.producao ELSE 0 END)
) AS RENDIMENTO_MEDIO_ATUAL_IRRIGADO,

rendimento_medio(
	SUM(CASE WHEN ${escolha_do_ano_2} = producao.ano THEN producao.area_colhida ELSE 0 END),
	SUM(CASE WHEN ${escolha_do_ano_2} = producao.ano THEN producao.producao ELSE 0 END)
) AS RENDIMENTO_MEDIO_ATUAL_TOTAL,


-- Calcula a variação da área colhida entre dois anos, para produtos não irrigado.
variacao_p(SUM(valida_sc(${escolha_do_ano_1}, producao.ano, 'N', producao.irrigado, producao.area_colhida)),
SUM(valida_sc(${escolha_do_ano_2}, producao.ano, 'N', producao.irrigado, producao.area_colhida))) AS VARIACAO_AREA_COLHIDA_NAO_IRRIGADO,

-- Calcula a variação da área colhida entre dois anos, para produtos não irrigado.
variacao_p(SUM(valida_sc(${escolha_do_ano_1}, producao.ano, 'N', producao.irrigado, producao.producao)),
SUM(valida_sc(${escolha_do_ano_2}, producao.ano, 'N', producao.irrigado, producao.producao))) AS VARIACAO_PRODUCAO_NAO_IRRIGADO,

-- Calcula a variação do rendimento médio entre dois anos, para produtos não irrigado.
variacao_p(
	rendimento_medio(
		SUM(CASE WHEN ${escolha_do_ano_1} = producao.ano AND 'N' = producao.irrigado THEN producao.area_colhida ELSE 0 END),
		SUM(CASE WHEN ${escolha_do_ano_1} = producao.ano AND 'N' = producao.irrigado THEN producao.producao ELSE 0 END)
	),
	rendimento_medio(
		SUM(CASE WHEN ${escolha_do_ano_2} = producao.ano AND 'N' = producao.irrigado THEN producao.area_colhida ELSE 0 END),
		SUM(CASE WHEN ${escolha_do_ano_2} = producao.ano AND 'N' = producao.irrigado THEN producao.producao ELSE 0 END)
	)
) AS VARIACAO_RENDIMENTO_NAO_IRRIGADO,



-- Calcula a variação da área colhida entre dois anos, para produtos irrigado.
variacao_p(SUM(valida_sc(${escolha_do_ano_1}, producao.ano, 'S', producao.irrigado, producao.area_colhida)),
SUM(valida_sc(${escolha_do_ano_2}, producao.ano, 'S', producao.irrigado, producao.area_colhida))) AS VARIACAO_AREA_COLHIDA_IRRIGADO,

-- Calcula a variação da produção entre dois anos, para produtos irrigado.
variacao_p(SUM(valida_sc(${escolha_do_ano_1}, producao.ano, 'S', producao.irrigado, producao.producao)),
SUM(valida_sc(${escolha_do_ano_2}, producao.ano, 'S', producao.irrigado, producao.producao))) AS VARIACAO_PRODUCAO_IRRIGADO,

-- Calcula a variação do rendimento médio entre dois anos, para produtos irrigado.
variacao_p(
	rendimento_medio(
		SUM(CASE WHEN ${escolha_do_ano_1} = producao.ano AND 'S' = producao.irrigado THEN producao.area_colhida ELSE 0 END),
		SUM(CASE WHEN ${escolha_do_ano_1} = producao.ano AND 'S' = producao.irrigado THEN producao.producao ELSE 0 END)
	),
	rendimento_medio(
		SUM(CASE WHEN ${escolha_do_ano_2} = producao.ano AND 'S' = producao.irrigado THEN producao.area_colhida ELSE 0 END),
		SUM(CASE WHEN ${escolha_do_ano_2} = producao.ano AND 'S' = producao.irrigado THEN producao.producao ELSE 0 END)
	)
) AS VARIACAO_RENDIMENTO_MEDIO_IRRIGADO,




-- Calcula a variação total (para irrigados + irrigados) da área colhida entre dois anos.
variacao_p(SUM(valida_valor(${escolha_do_ano_1}, producao.ano, producao.area_colhida)),
SUM(valida_valor(${escolha_do_ano_2}, producao.ano, producao.area_colhida))) AS VARIACAO_AREA_COLHIDA,

-- Calcula a variação total (para irrigados + irrigados) da produção entre dois anos.
variacao_p(SUM(valida_valor(${escolha_do_ano_1}, producao.ano, producao.producao)),
SUM(valida_valor(${escolha_do_ano_2}, producao.ano, producao.producao))) AS VARIACAO_PRODUCAO,

-- Calcula a variação total (para irrigados + irrigados) do rendimento médio entre dois anos.
variacao_p(
	rendimento_medio(
		SUM(CASE WHEN ${escolha_do_ano_1} = producao.ano THEN producao.area_colhida ELSE 0 END),
		SUM(CASE WHEN ${escolha_do_ano_1} = producao.ano THEN producao.producao ELSE 0 END)
	),
	rendimento_medio(
		SUM(CASE WHEN ${escolha_do_ano_2} = producao.ano THEN producao.area_colhida ELSE 0 END),
		SUM(CASE WHEN ${escolha_do_ano_2} = producao.ano THEN producao.producao ELSE 0 END)
	)
) AS VARIACAO_RENDIMENTO


FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN agricultura_grupo AS grupo ON produto.grupo_id = grupo.id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
INNER JOIN core_estado AS estado ON municipio.estado_id = estado.id
INNER JOIN core_microregiao AS microrregiao ON microrregiao.id = municipio.microregiao_id
INNER JOIN core_mesoregiao AS mesorregiao ON mesorregiao.id = microrregiao.mesoregiao_id

-- regiao_escolhida é um parâmetro que possui os objetos da classe região que foram selecionados. Ex.: Se região = 'Mesorregião', então regiao_escolhida = 'Central, Sul, Litoral, etc'.
WHERE
CASE WHEN ${regiao}='Estado' THEN estado.nome
	WHEN ${regiao}='Mesorregião' THEN mesorregiao.nome
	WHEN ${regiao}='Microrregião' THEN microrregiao.nome
	WHEN ${regiao}='Município' THEN municipio.nome
END IN (${regiao_escolhida})

-- sistema_de_cultivo é um parâmetro do tipo conjunto que contem os sistemas de cultivos selecionados pelo usuário
AND
producao.irrigado IN (${sistema_de_cultivo})

GROUP BY REGIAO_NOME, PG_NOME
ORDER BY PG_NOME;

-- Fim     HISTORIAS 8, 10, 11, 12, 13, 14 / GRUPO DE PRODUTOS E PRODUTOS





-- HISTORIAS 35 (quero saber a participação % na área colhida de um produto de um determinado
-- ano, de uma determinada região, em um dado sistema de cultivo (irrigado)) / PRODUTOS
--
-- PRODUTO/REGIÃO
-- Ambos irrigados e não Irrigados




SELECT
producao.ano AS ANO,

grupo.nome_grupo AS GRUPO,

CASE WHEN ${regiao}='Estado' THEN estado.nome
	WHEN ${regiao}='Mesorregião' THEN mesorregiao.nome
	WHEN ${regiao}='Microrregião' THEN microrregiao.nome
	WHEN ${regiao}='Município' THEN municipio.nome
END AS NOME_REGIAO,

produto.nome AS PRODUTO,

SUM(producao.area_colhida) AS AREA_COLHIDA,

CASE WHEN ${regiao}='Estado'
		THEN total_area_colhida (${regiao}, ${regiao_escolhida}, ${sistema_cultivo}, ${ano_escolhido})
	WHEN ${regiao}='Mesorregião'
		THEN total_area_colhida (${regiao}, ${regiao_escolhida}, ${sistema_cultivo}, ${ano_escolhido})
	WHEN ${regiao}='Microrregião'
		THEN total_area_colhida (${regiao}, ${regiao_escolhida}, ${sistema_cultivo}, ${ano_escolhido})
	WHEN ${regiao}='Município'
		THEN total_area_colhida (${regiao}, ${regiao_escolhida}, ${sistema_cultivo}, ${ano_escolhido})
END AS AREA_COLHIDA_TOTAL,



CASE WHEN ${regiao}='Estado'
		THEN participacao_percentual_area_colhida(SUM(producao.area_colhida), total_area_colhida (${regiao}, ${regiao_escolhida}, ${sistema_cultivo}, ${ano_escolhido}))
	WHEN ${regiao}='Mesorregião'
		THEN participacao_percentual_area_colhida(SUM(producao.area_colhida), total_area_colhida (${regiao}, ${regiao_escolhida}, ${sistema_cultivo}, ${ano_escolhido}))
	WHEN ${regiao}='Microrregião'
		THEN participacao_percentual_area_colhida(SUM(producao.area_colhida), total_area_colhida (${regiao}, ${regiao_escolhida}, ${sistema_cultivo}, ${ano_escolhido}))
	WHEN ${regiao}='Município'
		THEN participacao_percentual_area_colhida(SUM(producao.area_colhida), total_area_colhida (${regiao}, ${regiao_escolhida}, ${sistema_cultivo}, ${ano_escolhido}))
END AS PARTICIPACAO_PERCENTUAL_AREA_COLHIDA


FROM agricultura_producao AS producao
INNER JOIN agricultura_produto AS produto
ON producao.produto_id = produto.id
INNER JOIN agricultura_grupo AS grupo
ON produto.grupo_id = grupo.id
INNER JOIN core_municipio as municipio
on municipio.id = producao.municipio_id
INNER JOIN core_estado AS estado
ON municipio.estado_id = estado.id
INNER JOIN core_microregiao AS microrregiao
ON microrregiao.id = municipio.microregiao_id
INNER JOIN core_mesoregiao AS mesorregiao
ON mesorregiao.id = microrregiao.mesoregiao_id

WHERE
(CASE WHEN ${regiao}='Estado' THEN estado.nome
	WHEN ${regiao}='Mesorregião' THEN mesorregiao.nome
	WHEN ${regiao}='Microrregião' THEN microrregiao.nome
	WHEN ${regiao}='Município' THEN municipio.nome
END IN (${regiao_escolhida})
OR '1 - Todos' IN (${regiao_escolhida}))
AND producao.ano IN ( ${ano_escolhido})
AND (producao.irrigado = ${sistema_cultivo} OR ${sistema_cultivo} = 'T')

GROUP BY producao.ano, NOME_REGIAO, grupo.nome_grupo, produto.nome
ORDER BY grupo.nome_grupo, produto.nome





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
CREATE OR REPLACE FUNCTION rendimento_medio(area_colhida BIGINT, producao BIGINT) RETURNS INTEGER AS $$
BEGIN
	RETURN CASE WHEN area_colhida!= 0 THEN producao*1000/area_colhida ELSE 0 END;
END
$$ LANGUAGE plpgsql;


-- Calcula a variação percentual entre dois valores.
CREATE OR REPLACE FUNCTION variacao_p(VALOR_ANTIGO BIGINT, VALOR_RECENTE BIGINT) RETURNS FLOAT AS $$
BEGIN
	RETURN CASE WHEN CAST(VALOR_ANTIGO AS FLOAT) != 0 THEN ((CAST(VALOR_RECENTE AS FLOAT) - CAST(VALOR_ANTIGO AS FLOAT)) / CAST(VALOR_ANTIGO AS FLOAT)) * 100ELSE 0 END;
END
$$ LANGUAGE plpgsql;

--DROP FUNCTION variacao_p(BIGINT, BIGINT);


'''
Essa função recebe como parâmetro:
	- Tipo de região
	- id da região;
	- Sistema de cultivo (N = NÃO IRRIGADO, S = IRRIGADO, Qualquer outro caracter = IRRIGADO E NÃO IRRIGADO)
	- Ano
Ela retorna a soma total da área colhida de todos os produtos baseado nos parâmetros.
'''

CREATE OR REPLACE FUNCTION total_area_colhida (param_tipo_regiao VARCHAR, param_regiao_nome VARCHAR, param_irrigado CHARACTER VARYING(2), param_ano INTEGER) RETURNS BIGINT AS $$
BEGIN
	RETURN (SELECT SUM(producaoac.area_colhida)

	FROM agricultura_producao AS producaoac
	INNER JOIN core_municipio AS municipioac
	ON producaoac.municipio_id = municipioac.id
	INNER JOIN core_microregiao AS microac
	ON municipioac.microregiao_id = microac.id
	INNER JOIN core_mesoregiao AS mesoac
	ON microac.mesoregiao_id = mesoac.id

	WHERE (
		param_tipo_regiao = 'Estado'
		OR (param_tipo_regiao = 'Mesorregião' AND mesoac.nome = param_regiao_nome)
		OR (param_tipo_regiao = 'Microrregião' AND microac.nome = param_regiao_nome)
		OR (param_tipo_regiao = 'Município' AND municipioac.nome = param_regiao_nome)
		OR (param_regiao_nome ilike '%todos%')
	)
	AND ((producaoac.irrigado = param_irrigado) OR (param_irrigado = 'T'))
	AND producaoac.ano = param_ano);
END

$$ LANGUAGE plpgsql;

-- DROP FUNCTION total_area_colhida (param_tipo_regiao VARCHAR, param_regiao_nome VARCHAR, param_irrigado CHARACTER VARYING(2), param_ano INTEGER)




'''
Essa função recebe uma determinada quantidade de área colhida que é parte de um total, recebe também esse total e, com esses dados, calcula e retorna
a participação percentual dessa quantidade de área colhida em relação a esse total.

'''
CREATE OR REPLACE FUNCTION participacao_percentual_area_colhida (param_area_colhida BIGINT, param_total_area_colhida BIGINT) RETURNS DOUBLE PRECISION AS $$
BEGIN
	RETURN (
		CASE WHEN param_total_area_colhida > 0
			THEN ( CAST(param_area_colhida AS DOUBLE PRECISION) / CAST(param_total_area_colhida AS DOUBLE PRECISION) ) * 100
			ELSE 0
		END);
END

$$ LANGUAGE plpgsql;

-- DROP FUNCTION participacao_percentual_area_colhida (param_area_colhida BIGINT, param_total_area_colhida BIGINT)

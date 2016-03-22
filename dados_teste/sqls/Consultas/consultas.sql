-- HISTORIAS 1,3,16,17,19/PRODUTO/ESTADO
SELECT 
producao.ano AS "Ano",
producao.mes AS "Mês",
produto.nome AS "Produto",
estado.nome AS "Estado",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_plantada ELSE 0 END) "Área Plantada Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_plantada ELSE 0 END) "Área Plantada Irrigado",
SUM(producao.area_plantada) "Área Plantada Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_colhida ELSE 0 END) "Área Colhida Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_colhida ELSE 0 END) "Área Colhida Irrigado",
SUM(producao.area_colhida) "Área Colhida Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.producao ELSE 0 END) "Produção Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.producao ELSE 0 END) "Produção Irrigado",
SUM(producao.producao) "Produção Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Irrigado",
SUM(producao.area_em_formacao) "Área em Formação Total",
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS "Área Total",
SUM(CASE WHEN producao.area_colhida != 0 THEN producao.producao*1000/producao.area_colhida ELSE 0 END) AS "Rendimento Médio"
FROM       
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
INNER JOIN core_estado AS estado ON municipio.estado_id = estado.id
GROUP BY producao.mes, producao.ano,produto.nome, estado.nome 
ORDER BY produto.nome;


-- HISTORIAS 1,3,16,17,19/PRODUTO/MUNICIPIO
SELECT 
producao.ano AS "Ano",
producao.mes AS "Mês",
produto.nome AS "Produto",
municipio.nome AS "Município",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_plantada ELSE 0 END) "Área Plantada Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_plantada ELSE 0 END) "Área Plantada Irrigado",
SUM(producao.area_plantada) "Área Plantada Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_colhida ELSE 0 END) "Área Colhida Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_colhida ELSE 0 END) "Área Colhida Irrigado",
SUM(producao.area_colhida) "Área Colhida Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.producao ELSE 0 END) "Produção Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.producao ELSE 0 END) "Produção Irrigado",
SUM(producao.producao) "Produção Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Irrigado",
SUM(producao.area_em_formacao) "Área em formação",
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS "Área Total",
SUM(CASE WHEN producao.area_colhida != 0 THEN producao.producao*1000/producao.area_colhida ELSE 0 END) AS "Rendimento Médio"
FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
GROUP BY producao.mes, producao.ano,produto.nome, municipio.nome
ORDER BY municipio.nome;


-- HISTORIAS 1,3,16,17,19/PRODUTO/MESORREGIÃO
SELECT 
producao.ano AS "Ano",
producao.mes AS "Mês",
produto.nome AS "Produto",
mesorregiao.nome AS "Mesorregião",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_plantada ELSE 0 END) "Área Plantada Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_plantada ELSE 0 END) "Área Plantada Irrigado",
SUM(producao.area_plantada) "Área Plantada Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_colhida ELSE 0 END) "Área Colhida Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_colhida ELSE 0 END) "Área Colhida Irrigado",
SUM(producao.area_colhida) "Área Colhida Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.producao ELSE 0 END) "Produção Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.producao ELSE 0 END) "Produção Irrigado",
SUM(producao.producao) "Produção Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Irrigado",
SUM(producao.area_em_formacao) "Área em formação",
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS "Área Total",
SUM(CASE WHEN producao.area_colhida != 0 THEN producao.producao*1000/producao.area_colhida ELSE 0 END) AS "Rendimento Médio"
FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
INNER JOIN core_microregiao AS microrregiao ON microrregiao.id = municipio.microregiao_id
INNER JOIN core_mesoregiao AS mesorregiao ON mesorregiao.id = microrregiao.mesoregiao_id
GROUP BY producao.mes, producao.ano, produto.nome, mesorregiao.nome
ORDER BY mesorregiao.nome;

-- HISTORIAS 1,3,16,17,19/PRODUTO/MICRORREGIAO
SELECT 
producao.ano AS "Ano",
producao.mes AS "Mês",
produto.nome AS "Produto",
microrregiao.nome AS "Microrregião",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_plantada ELSE 0 END) "Área Plantada Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_plantada ELSE 0 END) "Área Plantada Irrigado",
SUM(producao.area_plantada) "Área Plantada Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_colhida ELSE 0 END) "Área Colhida Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_colhida ELSE 0 END) "Área Colhida Irrigado",
SUM(producao.area_colhida) "Área Colhida Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.producao ELSE 0 END) "Produção Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.producao ELSE 0 END) "Produção Irrigado",
SUM(producao.producao) "Produção Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Irrigado",
SUM(producao.area_em_formacao) "Área em formação",
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS "Área Total",
SUM(CASE WHEN producao.area_colhida != 0 THEN producao.producao*1000/producao.area_colhida ELSE 0 END) AS "Rendimento Médio"
FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
INNER JOIN core_microregiao AS microrregiao ON microrregiao.id = municipio.microregiao_id
GROUP BY producao.mes, producao.ano, produto.nome, microrregiao.nome
ORDER BY microrregiao.nome;





-- HISTORIAS 2,4,7,15,18,20/ POR ESTADO/GRUPOS
SELECT 
producao.ano AS "Ano",
producao.mes AS "Mês",
grupo.nome_grupo AS "Grupo",
estado.nome AS "Estado",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_plantada ELSE 0 END) "Área Plantada Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_plantada ELSE 0 END) "Área Plantada Irrigado",
SUM(producao.area_plantada) "Área Plantada Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_colhida ELSE 0 END) "Área Colhida Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_colhida ELSE 0 END) "Área Colhida Irrigado",
SUM(producao.area_colhida) "Área Colhida Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.producao ELSE 0 END) "Produção Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.producao ELSE 0 END) "Produção Irrigado",
SUM(producao.producao) "Produção Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Irrigado",
SUM(producao.area_em_formacao) "Área em formação",
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS "Área Total",
SUM(CASE WHEN producao.area_colhida != 0 THEN producao.producao*1000/producao.area_colhida ELSE 0 END) AS "Rendimento Médio"
FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN agricultura_grupo AS grupo ON produto.grupo_id = grupo.id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
INNER JOIN core_estado AS estado ON municipio.estado_id = estado.id
GROUP BY producao.mes, producao.ano, grupo.nome_grupo, estado.nome
ORDER BY grupo.nome_grupo;

-- HISTORIAS 2,4,7,15,18,20 / POR MUNICIPIO / GRUPOS
SELECT 
producao.ano AS "Ano",
producao.mes AS "Mês",
grupo.nome_grupo AS "Grupo",
municipio.nome AS "Município",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_plantada ELSE 0 END) "Área Plantada Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_plantada ELSE 0 END) "Área Plantada Irrigado",
SUM(producao.area_plantada) "Área Plantada Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_colhida ELSE 0 END) "Área Colhida Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_colhida ELSE 0 END) "Área Colhida Irrigado",
SUM(producao.area_colhida) "Área Colhida Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.producao ELSE 0 END) "Produção Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.producao ELSE 0 END) "Produção Irrigado",
SUM(producao.producao) "Produção Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Irrigado",
SUM(producao.area_em_formacao) "Área em formação",
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS "Área Total",
SUM(CASE WHEN producao.area_colhida != 0 THEN producao.producao*1000/producao.area_colhida ELSE 0 END) AS "Rendimento Médio"
FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN agricultura_grupo AS grupo ON produto.grupo_id = grupo.id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
GROUP BY producao.mes, producao.ano, grupo.nome_grupo, municipio.nome
ORDER BY grupo.nome_grupo;


-- HISTORIAS 2,4,7,15,18,20/ POR MICRORREGIÃO/GRUPOS
SELECT 
producao.ano AS "Ano",
producao.mes AS "Mês",
grupo.nome_grupo AS "Grupo",
microrregiao.nome AS "Microrregião",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_plantada ELSE 0 END) "Área Plantada Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_plantada ELSE 0 END) "Área Plantada Irrigado",
SUM(producao.area_plantada) "Área Plantada Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_colhida ELSE 0 END) "Área Colhida Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_colhida ELSE 0 END) "Área Colhida Irrigado",
SUM(producao.area_colhida) "Área Colhida Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.producao ELSE 0 END) "Produção Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.producao ELSE 0 END) "Produção Irrigado",
SUM(producao.producao) "Produção Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Irrigado",
SUM(producao.area_em_formacao) "Área em formação",
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS "Área Total",
SUM(CASE WHEN producao.area_colhida != 0 THEN producao.producao*1000/producao.area_colhida ELSE 0 END) AS "Rendimento Médio"
FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN agricultura_grupo AS grupo ON produto.grupo_id = grupo.id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
INNER JOIN core_microregiao AS microrregiao ON microrregiao.id = municipio.microregiao_id
GROUP BY producao.mes, producao.ano, grupo.nome_grupo, microrregiao.nome
ORDER BY grupo.nome_grupo;


-- HISTORIAS 2,4,7,15,18,20 / POR MESORREGIÃO / GRUPOS
SELECT 
producao.ano AS "Ano",
producao.mes AS "Mês",
grupo.nome_grupo AS "Grupo",
mesorregiao.nome AS "Mesorregião",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_plantada ELSE 0 END) "Área Plantada Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_plantada ELSE 0 END) "Área Plantada Irrigado",
SUM(producao.area_plantada) "Área Plantada Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_colhida ELSE 0 END) "Área Colhida Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_colhida ELSE 0 END) "Área Colhida Irrigado",
SUM(producao.area_colhida) "Área Colhida Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.producao ELSE 0 END) "Produção Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.producao ELSE 0 END) "Produção Irrigado",
SUM(producao.producao) "Produção Total",
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Não Irrigado",
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_em_formacao ELSE 0 END) "Área em Formação Irrigado",
SUM(producao.area_em_formacao) "Área em formação",
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS "Área Total",
SUM(CASE WHEN producao.area_colhida != 0 THEN producao.producao*1000/producao.area_colhida ELSE 0 END) AS "Rendimento Médio"
FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN agricultura_grupo AS grupo ON produto.grupo_id = grupo.id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
INNER JOIN core_microregiao AS microrregiao ON microrregiao.id = municipio.microregiao_id
INNER JOIN core_mesoregiao AS mesorregiao ON mesorregiao.id = microrregiao.mesoregiao_id
GROUP BY producao.mes, producao.ano, grupo.nome_grupo, mesorregiao.nome
ORDER BY grupo.nome_grupo;


-- POR MUNICIPIO/ IRRIGADO/ NAO IRRIGADO (RELATORIO - DRIVE)
SELECT 
producao.ano,
producao.mes,
produto.nome AS produto,
municipio.nome as municipio_nome,
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_plantada ELSE 0 END) area_plantada_Nao_Irrigado,
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_plantada ELSE 0 END) area_plantada_Irrigado,
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.area_colhida ELSE 0 END) area_colhida_Nao_Irrigado,
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.area_colhida ELSE 0 END) area_colhida_Irrigado,
SUM(CASE WHEN producao.irrigado = 'N' THEN producao.producao ELSE 0 END) Producao_Nao_Irrigado,
SUM(CASE WHEN producao.irrigado = 'S' THEN producao.producao ELSE 0 END) Producao_Irrigado
FROM       
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
GROUP BY producao.mes, producao.ano,produto.nome, municipio.nome 
ORDER BY municipio.nome;

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

-- 


-- HISTORIAS 8, 11, 13 / PRODUTOS
-- PRODUTO/ESTADO
-- Ambos irrigados e não Irrigados
SELECT 
produto.nome AS "Produto",
estado.nome AS "Estado",
SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida)) AS "Área colhida Anterior Não Irrigado",
SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida)) AS "Área colhida Anterior Irrigado",
SUM(valida_valor(2014, producao.ano, producao.area_colhida)) AS "Área colhida Anterior Total",
SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.producao)) AS "Produção Anterior Não Irrigado",
SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.producao)) AS "Produção Anterior Irrigado",
SUM(valida_valor(2014, producao.ano, producao.producao)) AS "Produção Anterior Total",
SUM(rendimento_medio_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Anterior Não Irrigado",
SUM(rendimento_medio_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Anterior Irrigado",
SUM(rendimento_medio(2014, producao.ano, producao.area_colhida, producao.producao)) AS "Rendimento Médio Anterior Total",


SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida)) AS "Área colhida Atual Não Irrigado",
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida)) AS "Área colhida Atual Irrigado",
SUM(valida_valor(2015, producao.ano, producao.area_colhida)) AS "Área colhida Atual Total",
SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.producao)) AS "Produção Atual Não Irrigado",
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.producao)) AS "Produção Atual Irrigado",
SUM(valida_valor(2015, producao.ano, producao.producao)) AS "Produção Atual Total",
SUM(rendimento_medio_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Atual Não Irrigado",
SUM(rendimento_medio_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Atual Irrigado",
SUM(rendimento_medio(2015, producao.ano, producao.area_colhida, producao.producao)) AS "Rendimento Médio Atual Total",


-- Variação Não Irrigado

variacao_p(SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida)), 
SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida))) AS "Variação da Área Colhida Não Irrigada",

variacao_p(SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.producao)), 
SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.producao))) AS "Variação da Produção Não Irrigada",

variacao_p(SUM(rendimento_medio_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)),
SUM(rendimento_medio_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao))) AS "Variação do Rendimento Não Irrigado",

-- Fim Variação Não Irrigado


-- Variação Irrigado

variacao_p(SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida)), 
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida))) AS "Variação da Área Colhida Irrigada",

variacao_p(SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.producao)), 
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.producao))) AS "Variação da Produção Irrigada",

variacao_p(SUM(rendimento_medio_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)),
SUM(rendimento_medio_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao))) AS "Variação do Rendimento Irrigado",

-- Fim Variação Irrigado



-- Variação Total
variacao_p(SUM(valida_valor(2014, producao.ano, producao.area_colhida)), 
SUM(valida_valor(2015, producao.ano, producao.area_colhida))) AS "Variação da Área Colhida Total",

variacao_p(SUM(valida_valor(2014, producao.ano, producao.producao)), 
SUM(valida_valor(2015, producao.ano, producao.producao))) AS "Variação da Produção Total",

variacao_p(SUM(rendimento_medio(2014, producao.ano, producao.area_colhida, producao.producao)),
SUM(rendimento_medio(2015, producao.ano, producao.area_colhida, producao.producao))) AS "Variação do Rendimento Total"

-- Fim Variação Total


FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
INNER JOIN core_estado AS estado ON municipio.estado_id = estado.id
GROUP BY estado.nome, produto.nome
ORDER BY produto.nome;

-- FIM   VARIAÇÃO PERCENTUAL PRODUTO/ESTADO --


-- PRODUTO/MUNICIPIO
-- Ambos irrigados e não Irrigados
SELECT 
produto.nome AS "Produto",
municipio.nome AS "Município",
SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida)) AS "Área colhida Anterior Não Irrigado",
SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida)) AS "Área colhida Anterior Irrigado",
SUM(valida_valor(2014, producao.ano, producao.area_colhida)) AS "Área colhida Anterior Total",
SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.producao)) AS "Produção Anterior Não Irrigado",
SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.producao)) AS "Produção Anterior Irrigado",
SUM(valida_valor(2014, producao.ano, producao.producao)) AS "Produção Anterior Total",
SUM(rendimento_medio_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Anterior Não Irrigado",
SUM(rendimento_medio_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Anterior Irrigado",
SUM(rendimento_medio(2014, producao.ano, producao.area_colhida, producao.producao)) AS "Rendimento Médio Anterior Total",


SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida)) AS "Área colhida Atual Não Irrigado",
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida)) AS "Área colhida Atual Irrigado",
SUM(valida_valor(2015, producao.ano, producao.area_colhida)) AS "Área colhida Atual Total",
SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.producao)) AS "Produção Atual Não Irrigado",
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.producao)) AS "Produção Atual Irrigado",
SUM(valida_valor(2015, producao.ano, producao.producao)) AS "Produção Atual Total",
SUM(rendimento_medio_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Atual Não Irrigado",
SUM(rendimento_medio_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Atual Irrigado",
SUM(rendimento_medio(2015, producao.ano, producao.area_colhida, producao.producao)) AS "Rendimento Médio Atual Total",


-- Variação Não Irrigado

variacao_p(SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida)), 
SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida))) AS "Variação da Área Colhida Não Irrigada",

variacao_p(SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.producao)), 
SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.producao))) AS "Variação da Produção Não Irrigada",

variacao_p(SUM(rendimento_medio_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)),
SUM(rendimento_medio_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao))) AS "Variação do Rendimento Não Irrigado",

-- Fim Variação Não Irrigado


-- Variação Irrigado

variacao_p(SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida)), 
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida))) AS "Variação da Área Colhida Irrigada",

variacao_p(SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.producao)), 
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.producao))) AS "Variação da Produção Irrigada",

variacao_p(SUM(rendimento_medio_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)),
SUM(rendimento_medio_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao))) AS "Variação do Rendimento Irrigado",

-- Fim Variação Irrigado



-- Variação Total
variacao_p(SUM(valida_valor(2014, producao.ano, producao.area_colhida)), 
SUM(valida_valor(2015, producao.ano, producao.area_colhida))) AS "Variação da Área Colhida",

variacao_p(SUM(valida_valor(2014, producao.ano, producao.producao)), 
SUM(valida_valor(2015, producao.ano, producao.producao))) AS "Variação da Produção",

variacao_p(SUM(rendimento_medio(2014, producao.ano, producao.area_colhida, producao.producao)),
SUM(rendimento_medio(2015, producao.ano, producao.area_colhida, producao.producao))) AS "Variação do Rendimento"

-- Fim Variação Total


FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
GROUP BY municipio.nome, produto.nome
ORDER BY municipio.nome;

-- FIM   VARIAÇÃO PERCENTUAL PRODUTO/MUNICIPIO --

-- PRODUTO/MICRORREGIÃO
-- Ambos irrigados e não Irrigados
SELECT 
produto.nome AS "Produto",
microrregiao.nome AS "Microrregião",
SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida)) AS "Área colhida Anterior Não Irrigado",
SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida)) AS "Área colhida Anterior Irrigado",
SUM(valida_valor(2014, producao.ano, producao.area_colhida)) AS "Área colhida Anterior Total",
SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.producao)) AS "Produção Anterior Não Irrigado",
SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.producao)) AS "Produção Anterior Irrigado",
SUM(valida_valor(2014, producao.ano, producao.producao)) AS "Produção Anterior Total",
SUM(rendimento_medio_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Anterior Não Irrigado",
SUM(rendimento_medio_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Anterior Irrigado",
SUM(rendimento_medio(2014, producao.ano, producao.area_colhida, producao.producao)) AS "Rendimento Médio Anterior Total",


SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida)) AS "Área colhida Atual Não Irrigado",
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida)) AS "Área colhida Atual Irrigado",
SUM(valida_valor(2015, producao.ano, producao.area_colhida)) AS "Área colhida Atual Total",
SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.producao)) AS "Produção Atual Não Irrigado",
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.producao)) AS "Produção Atual Irrigado",
SUM(valida_valor(2015, producao.ano, producao.producao)) AS "Produção Atual Total",
SUM(rendimento_medio_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Atual Não Irrigado",
SUM(rendimento_medio_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Atual Irrigado",
SUM(rendimento_medio(2015, producao.ano, producao.area_colhida, producao.producao)) AS "Rendimento Médio Atual Total",


-- Variação Não Irrigado

variacao_p(SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida)), 
SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida))) AS "Variação da Área Colhida Não Irrigada",

variacao_p(SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.producao)), 
SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.producao))) AS "Variação da Produção Não Irrigada",

variacao_p(SUM(rendimento_medio_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)),
SUM(rendimento_medio_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao))) AS "Variação do Rendimento Não Irrigado",

-- Fim Variação Não Irrigado


-- Variação Irrigado

variacao_p(SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida)), 
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida))) AS "Variação da Área Colhida Irrigada",

variacao_p(SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.producao)), 
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.producao))) AS "Variação da Produção Irrigada",

variacao_p(SUM(rendimento_medio_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)),
SUM(rendimento_medio_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao))) AS "Variação do Rendimento Irrigado",

-- Fim Variação Irrigado



-- Variação Total
variacao_p(SUM(valida_valor(2014, producao.ano, producao.area_colhida)), 
SUM(valida_valor(2015, producao.ano, producao.area_colhida))) AS "Variação da Área Colhida",

variacao_p(SUM(valida_valor(2014, producao.ano, producao.producao)), 
SUM(valida_valor(2015, producao.ano, producao.producao))) AS "Variação da Produção",

variacao_p(SUM(rendimento_medio(2014, producao.ano, producao.area_colhida, producao.producao)),
SUM(rendimento_medio(2015, producao.ano, producao.area_colhida, producao.producao))) AS "Variação do Rendimento"

-- Fim Variação Total


FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
INNER JOIN core_microregiao AS microrregiao ON microrregiao.id = municipio.microregiao_id
GROUP BY microrregiao.nome, produto.nome
ORDER BY microrregiao.nome;

-- FIM   VARIAÇÃO PERCENTUAL PRODUTO/MICRORREGIÃO --



-- PRODUTO/MESORREGIÃO
-- Ambos irrigados e não Irrigados
SELECT 
produto.nome AS "Produto",
mesorregiao.nome AS "Mesorregião",
SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida)) AS "Área colhida Anterior Não Irrigado",
SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida)) AS "Área colhida Anterior Irrigado",
SUM(valida_valor(2014, producao.ano, producao.area_colhida)) AS "Área colhida Anterior Total",
SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.producao)) AS "Produção Anterior Não Irrigado",
SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.producao)) AS "Produção Anterior Irrigado",
SUM(valida_valor(2014, producao.ano, producao.producao)) AS "Produção Anterior Total",
SUM(rendimento_medio_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Anterior Não Irrigado",
SUM(rendimento_medio_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Anterior Irrigado",
SUM(rendimento_medio(2014, producao.ano, producao.area_colhida, producao.producao)) AS "Rendimento Médio Anterior Total",


SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida)) AS "Área colhida Atual Não Irrigado",
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida)) AS "Área colhida Atual Irrigado",
SUM(valida_valor(2015, producao.ano, producao.area_colhida)) AS "Área colhida Atual Total",
SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.producao)) AS "Produção Atual Não Irrigado",
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.producao)) AS "Produção Atual Irrigado",
SUM(valida_valor(2015, producao.ano, producao.producao)) AS "Produção Atual Total",
SUM(rendimento_medio_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Atual Não Irrigado",
SUM(rendimento_medio_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)) AS "Rendimento Médio Atual Irrigado",
SUM(rendimento_medio(2015, producao.ano, producao.area_colhida, producao.producao)) AS "Rendimento Médio Atual Total",


-- Variação Não Irrigado

variacao_p(SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida)), 
SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida))) AS "Variação da Área Colhida Não Irrigada",

variacao_p(SUM(valida_sc(2014, producao.ano, 'N', producao.irrigado, producao.producao)), 
SUM(valida_sc(2015, producao.ano, 'N', producao.irrigado, producao.producao))) AS "Variação da Produção Não Irrigada",

variacao_p(SUM(rendimento_medio_sc(2014, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao)),
SUM(rendimento_medio_sc(2015, producao.ano, 'N', producao.irrigado, producao.area_colhida, producao.producao))) AS "Variação do Rendimento Não Irrigado",

-- Fim Variação Não Irrigado


-- Variação Irrigado

variacao_p(SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida)), 
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida))) AS "Variação da Área Colhida Irrigada",

variacao_p(SUM(valida_sc(2014, producao.ano, 'S', producao.irrigado, producao.producao)), 
SUM(valida_sc(2015, producao.ano, 'S', producao.irrigado, producao.producao))) AS "Variação da Produção Irrigada",

variacao_p(SUM(rendimento_medio_sc(2014, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao)),
SUM(rendimento_medio_sc(2015, producao.ano, 'S', producao.irrigado, producao.area_colhida, producao.producao))) AS "Variação do Rendimento Irrigado",

-- Fim Variação Irrigado



-- Variação Total
variacao_p(SUM(valida_valor(2014, producao.ano, producao.area_colhida)), 
SUM(valida_valor(2015, producao.ano, producao.area_colhida))) AS "Variação da Área Colhida",

variacao_p(SUM(valida_valor(2014, producao.ano, producao.producao)), 
SUM(valida_valor(2015, producao.ano, producao.producao))) AS "Variação da Produção",

variacao_p(SUM(rendimento_medio(2014, producao.ano, producao.area_colhida, producao.producao)),
SUM(rendimento_medio(2015, producao.ano, producao.area_colhida, producao.producao))) AS "Variação do Rendimento"

-- Fim Variação Total


FROM
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
INNER JOIN core_microregiao AS microrregiao ON microrregiao.id = municipio.microregiao_id
INNER JOIN core_mesoregiao AS mesorregiao ON mesorregiao.id = microrregiao.mesoregiao_id
GROUP BY mesorregiao.nome, produto.nome
ORDER BY mesorregiao.nome;

-- FIM   VARIAÇÃO PERCENTUAL PRODUTO/MESORREGIÃO --
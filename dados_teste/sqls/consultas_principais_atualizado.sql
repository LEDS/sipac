
-- SOMATORIO POR SUBGRUPO DE PRODUTOS / COM NOME
SELECT 
producao.ano,
producao.mes,
produto.nome,
subgrupo.nome_subgrupo AS subgrupo,
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.area_colhida) AS area_colhida,
SUM(producao.producao) AS producao
FROM agricultura_produto AS produto
INNER JOIN agricultura_subgrupo AS subgrupo ON produto.subgrupo_id = subgrupo.id
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id 
GROUP BY produto.nome,subgrupo.nome_subgrupo, producao.ano, producao.mes
ORDER BY subgrupo.nome_subgrupo

-- SOMATORIO POR SUBGRUPOS/ SEM NOME
SELECT 
producao.ano,
producao.mes,
subgrupo.nome_subgrupo AS subgrupo,
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.area_colhida) AS area_colhida,
SUM(producao.producao) AS producao
FROM agricultura_produto AS produto
INNER JOIN agricultura_subgrupo AS subgrupo ON produto.subgrupo_id = subgrupo.id
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id 
GROUP BY subgrupo.nome_subgrupo, producao.ano, producao.mes
ORDER BY subgrupo.nome_subgrupo

--POR MUNICIPIO/ AGRUPADO POR PRODUTO
SELECT 
producao.ano,
producao.mes,
produto.nome,
municipio.nome AS municipio,
SUM(producao.area_colhida) AS area_colhida, 
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.producao) AS producao
FROM core_municipio AS municipio 
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
INNER JOIN agricultura_produto AS produto ON produto.id = producao.produto_id
GROUP BY municipio.nome, produto.nome, producao.mes, producao.ano
ORDER BY produto.nome


--PRODUTO/MUNICIPIO
SELECT
producao.ano, 
producao.mes, 
produto.nome AS produto, 
municipio.nome AS municipio, 
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.area_colhida) AS area_colhida,
SUM(producao.producao) AS producao, 
SUM(producao.area_em_formacao) AS area_em_formacao,
producao.irrigado AS irrigado 
FROM core_municipio AS municipio 
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
INNER JOIN agricultura_produto AS produto ON producao.produto_id = produto.id
GROUP BY municipio.nome,produto.nome,producao.irrigado,producao.ano,producao.mes
ORDER BY municipio.nome


--PRODUTO/MESO
SELECT 
producao.ano, 
producao.mes, 
produto.nome AS produto,
mesoregiao.nome AS mesorregiao, 
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.area_colhida) AS area_colhida,
SUM(producao.producao) AS producao, 
SUM(producao.area_em_formacao) AS area_em_formacao,
producao.irrigado AS irrigado
FROM core_municipio AS municipio
INNER JOIN core_microregiao AS microregiao ON municipio.microregiao_id = microregiao.id
INNER JOIN core_mesoregiao AS mesoregiao ON microregiao.id = mesoregiao.id
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
INNER JOIN agricultura_produto AS produto ON produto.id = producao.produto_id
GROUP BY mesoregiao.nome, produto.nome,producao.irrigado,producao.ano,producao.mes
ORDER BY mesoregiao.nome


--PRODUTO/MICRO
SELECT 
producao.ano, 
producao.mes, 
produto.nome AS produto,
microregiao.nome AS microrregiao, 
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.area_colhida) AS area_colhida,
SUM(producao.producao) AS producao, 
SUM(producao.area_em_formacao) AS area_em_formacao,
producao.irrigado AS irrigado
FROM core_municipio AS municipio
INNER JOIN core_microregiao AS microregiao ON municipio.microregiao_id = microregiao.id
INNER JOIN core_mesoregiao AS mesoregiao ON microregiao.id = mesoregiao.id
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
INNER JOIN agricultura_produto AS produto ON produto.id = producao.produto_id
GROUP BY microregiao.nome, produto.nome, producao.ano, producao.mes, mesoregiao.nome,producao.irrigado
ORDER BY microregiao.nome

-- POR MUNICIPIO/NAO IRRIGADO
SELECT
producao.ano,
producao.mes,
produto.nome AS produto,
municipio.nome AS municipio,
SUM(producao.area_colhida) AS area_colhida,
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.producao) AS producao
FROM agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN core_municipio AS municipio ON producao.municipio_id = municipio.id
WHERE producao.irrigado = 'N'
GROUP BY producao.mes, producao.ano,produto.nome, municipio.nome,producao.area_plantada, producao.irrigado
ORDER BY municipio.nome

-- POR MUNICIPIO/IRRIGADO
SELECT
producao.ano,
producao.mes,
produto.nome AS produto,
municipio.nome AS municipio,
SUM(producao.area_colhida) AS area_colhida,
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.producao) AS producao
FROM agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN core_municipio AS municipio ON producao.municipio_id = municipio.id
WHERE producao.irrigado = 'S'
GROUP BY producao.mes, producao.ano,produto.nome, municipio.nome,producao.area_plantada, producao.irrigado
ORDER BY municipio.nome

-- TODO ESTADO/ NAO IRRIGADO
SELECT
producao.ano,
producao.mes,
produto.nome AS produto,
SUM(producao.area_colhida) AS area_colhida,
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.producao) AS producao
FROM agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
WHERE producao.irrigado = 'N'
GROUP BY producao.mes, producao.ano,produto.nome
ORDER BY produto.nome

-- TODO ESTADO/IRRIGADO
SELECT
producao.ano,
producao.mes,
produto.nome AS produto,
SUM(producao.area_colhida) AS area_colhida,
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.producao) AS producao
FROM agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
WHERE producao.irrigado = 'S'
GROUP BY producao.mes, producao.ano,produto.nome
ORDER BY produto.nome


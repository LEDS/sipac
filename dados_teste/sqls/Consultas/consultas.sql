
-- HISTORIAS 1,3,16,17,19/PRODUTO/MUNICIPIO
SELECT
producao.ano, 
producao.mes, 
produto.nome AS produto, 
municipio.nome AS municipio, 
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.area_colhida) AS area_colhida,
SUM(producao.producao) AS producao, 
SUM(producao.area_em_formacao) AS area_em_formacao,
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS Area_Total,
(SUM(producao.producao) * 1000)/ (SUM(producao.area_colhida)) as rendimento_medio,
producao.irrigado
FROM core_municipio AS municipio 
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
INNER JOIN agricultura_produto AS produto ON producao.produto_id = produto.id
WHERE producao.area_colhida != 0
GROUP BY municipio.nome,produto.nome,producao.irrigado,producao.ano,producao.mes
ORDER BY municipio.nome


-- HISTORIAS 1,3,16,17,19/PRODUTO/MESO
SELECT 
producao.ano, 
producao.mes, 
produto.nome AS produto,
mesoregiao.nome AS mesorregiao, 
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.area_colhida) AS area_colhida,
SUM(producao.producao) AS producao, 
SUM(producao.area_em_formacao) AS area_em_formacao,
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS Area_Total,
(SUM(producao.producao) * 1000)/ (SUM(producao.area_colhida)) as rendimento_medio
producao.irrigado
FROM core_municipio AS municipio
INNER JOIN core_microregiao AS microregiao ON municipio.microregiao_id = microregiao.id
INNER JOIN core_mesoregiao AS mesoregiao ON microregiao.id = mesoregiao.id
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
INNER JOIN agricultura_produto AS produto ON produto.id = producao.produto_id
GROUP BY mesoregiao.nome, produto.nome,producao.irrigado,producao.ano,producao.mes
ORDER BY mesoregiao.nome

-- HISTORIAS 1,3,16,17,19/PRODUTO/MICRO
SELECT 
producao.ano, 
producao.mes, 
produto.nome AS produto,
microregiao.nome AS microrregiao, 
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.area_colhida) AS area_colhida,
SUM(producao.producao) AS producao, 
SUM(producao.area_em_formacao) AS area_em_formacao,
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS Area_Total,
(SUM(producao.producao) * 1000)/ (SUM(producao.area_colhida)) as rendimento_medio
producao.irrigado
FROM core_municipio AS municipio
INNER JOIN core_microregiao AS microregiao ON municipio.microregiao_id = microregiao.id
INNER JOIN core_mesoregiao AS mesoregiao ON microregiao.id = mesoregiao.id
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
INNER JOIN agricultura_produto AS produto ON produto.id = producao.produto_id
GROUP BY microregiao.nome, produto.nome, producao.ano, producao.mes, mesoregiao.nome,producao.irrigado
ORDER BY microregiao.nome


-- HISTORIAS 2,4,7,15,18,20/ POR MUNICIPIO/GRUPOS
SELECT
producao.ano,
producao.mes,
municipio.nome AS municipio,
grupo.nome_grupo AS grupo,
SUM(producao.area_plantada) area_plantada,
SUM(producao.area_colhida) area_colhida,
SUM(producao.producao) producao,
SUM(producao.area_em_formacao) area_em_formacao,
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS Area_Total,
(SUM(producao.producao) * 1000)/ (SUM(producao.area_colhida)) as rendimento_medio
FROM agricultura_producao AS producao 
INNER JOIN core_municipio AS municipio ON producao.municipio_id = municipio.id
INNER JOIN agricultura_produto AS produto ON producao.produto_id = produto.id
INNER JOIN agricultura_grupo AS grupo ON produto.grupo_id = grupo.id
WHERE producao.area_colhida != 0 
GROUP BY municipio.nome,grupo.nome_grupo,producao.ano,producao.mes
ORDER BY municipio.nome


-- HISTORIAS 2,4,7,15,18,20/POR MICRO/GRUPOS
SELECT
producao.ano,
producao.mes,
micro.nome AS microrregiao,
grupo.nome_grupo AS grupo,
SUM(producao.area_plantada) area_plantada,
SUM(producao.area_colhida) area_colhida,
SUM(producao.producao) producao,
SUM(producao.area_em_formacao) area_em_formacao,
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS Area_Total,
(SUM(producao.producao) * 1000)/ (SUM(producao.area_colhida)) as rendimento_medio
FROM agricultura_producao AS producao 
INNER JOIN core_municipio AS municipio ON producao.municipio_id = municipio.id
INNER JOIN core_microregiao AS micro ON municipio.microregiao_id = micro.id
INNER JOIN agricultura_produto AS produto ON producao.produto_id = produto.id
INNER JOIN agricultura_grupo AS grupo ON produto.grupo_id = grupo.id
WHERE producao.area_colhida != 0 
GROUP BY micro.nome,grupo.nome_grupo,producao.ano,producao.mes
ORDER BY micro.nome


-- HISTORIAS 2,4,7,15,18,20/POR MESO/GRUPOS
SELECT
producao.ano,
producao.mes,
meso.nome AS mesorregiao,
grupo.nome_grupo AS grupo,
SUM(producao.area_plantada) area_plantada,
SUM(producao.area_colhida) area_colhida,
SUM(producao.producao) producao,
SUM(producao.area_em_formacao) area_em_formacao,
(SUM(producao.area_em_formacao) + SUM(producao.producao)) AS Area_Total,
(SUM(producao.producao) * 1000)/ (SUM(producao.area_colhida)) as rendimento_medio
FROM agricultura_producao AS producao 
INNER JOIN core_municipio AS municipio ON producao.municipio_id = municipio.id
INNER JOIN core_microregiao AS micro ON municipio.microregiao_id = micro.id
INNER JOIN core_mesoregiao AS meso ON meso.id = micro.mesoregiao_id
INNER JOIN agricultura_produto AS produto ON producao.produto_id = produto.id
INNER JOIN agricultura_grupo AS grupo ON produto.grupo_id = grupo.id
WHERE producao.area_colhida != 0 
GROUP BY meso.nome,grupo.nome_grupo,producao.ano,producao.mes
ORDER BY meso.nome


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
ORDER BY municipio.nome


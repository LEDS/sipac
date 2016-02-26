--PRODUTO/MUNICIPIO
SELECT
producao.ano, 
producao.mes, 
produto.nome AS produto, 
municipio.nome AS municipio, 
SUM(producao.area_em_producao) AS area_em_producao,
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.area_colhida) AS area_colhida, 
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
SUM(producao.area_em_producao) AS area_em_producao,
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.area_colhida) AS area_colhida, 
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
SUM(producao.area_em_producao) AS area_em_producao,
SUM(producao.area_plantada) AS area_plantada,
SUM(producao.area_colhida) AS area_colhida, 
SUM(producao.area_em_formacao) AS area_em_formacao,
producao.irrigado AS irrigado
FROM core_municipio AS municipio
INNER JOIN core_microregiao AS microregiao ON municipio.microregiao_id = microregiao.id
INNER JOIN core_mesoregiao AS mesoregiao ON microregiao.id = mesoregiao.id
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
INNER JOIN agricultura_produto AS produto ON produto.id = producao.produto_id
GROUP BY microregiao.nome, produto.nome, producao.ano, producao.mes, mesoregiao.nome,producao.irrigado
ORDER BY microregiao.nome


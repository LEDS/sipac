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


-- Variacão entre anos da producao de um produto por municipio
SELECT 
produto.nome,
municipio.nome as municipio_nome,
(SUM(CASE WHEN producao.ano =  2015 THEN producao.area_plantada ELSE 0 END) - 
SUM(CASE WHEN producao.ano =  2014 THEN producao.area_plantada ELSE 0 END)) AS diferencao_ANO
FROM       
agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
INNER JOIN core_municipio as municipio on municipio.id = producao.municipio_id
WHERE producao.ano between 2014 AND 2015
GROUP BY  municipio.nome, produto.nome
ORDER BY municipio.nome;
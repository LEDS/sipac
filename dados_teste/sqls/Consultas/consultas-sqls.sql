
-- Pega a area colhida de todos os produtos,de todos os meses e anos presentes na tabela
SELECT area_colhida FROM agricultura_producao

-- Faz o somatorio de toda area colhida de todos os produtos, de todos os meses e anos, agrupa e ordena em ordem alfabetica
SELECT produto.nome, SUM(producao.area_colhida) FROM agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id =  producao.produto_id
GROUP BY produto.nome
ORDER BY produto.nome

-- Faz o somatorio de toda area colhida de todos os produtos, municipios, de todos os meses e anos, agrupa e ordena em ordem alfabetica
SELECT municipio.nome, SUM(producao.area_colhida) FROM core_municipio AS municipio 
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
GROUP BY municipio.nome
ORDER BY municipio.nome

-- Faz o somatorio de toda area colhida de todos os produtos, microrregioes, de todos os meses e anos, agrupa e ordena em ordem alfabetica
SELECT microregiao.nome, SUM(producao.area_colhida) FROM core_municipio AS municipio
INNER JOIN core_microregiao AS  microregiao ON municipio.microregiao_id = microregiao.id
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
GROUP BY microregiao.nome
ORDER BY microregiao.nome


-- Faz o somatorio de toda area colhida de todos os produtos, mesorregioes, de todos os meses e anos, agrupa e ordena em ordem alfabetica
-- Esse select abaixo também mostra a media de area colhida e renomeia a coluna
--SELECT mesoregiao.nome, SUM(producao.area_colhida), AVG(producao.area_colhida) as "Media Colhida" FROM core_municipio AS municipio
SELECT mesoregiao.nome, SUM(producao.area_colhida) FROM core_municipio AS municipio
INNER JOIN core_microregiao AS microregiao ON municipio.microregiao_id = microregiao.id
INNER JOIN core_mesoregiao AS mesoregiao ON microregiao.id = mesoregiao.id
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
GROUP BY mesoregiao.nome
ORDER BY mesoregiao.nome

-- Faz o somatorio da area colhida do estado todo, de todos os produtos.
SELECT  estado.nome,SUM(producao.area_colhida) FROM core_estado AS estado
INNER JOIN core_municipio AS municipio ON municipio.id =  estado.id
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
GROUP BY estado.nome

-- Não pode fazer isso aqui, pq ele tá somando todo mundo que tem id = 103 da tabela produto e somando todo mundo que tem id = 103 da tabela 
-- producao e nao juntando as duas e somando depois como era o desejado.
SELECT produto.nome,SUM(producao.area_colhida) FROM agricultura_produto AS produto, agricultura_producao AS producao 
WHERE produto.id = 103
GROUP BY produto.nome

-- Faz o somatorio de toda area colhida de um determinado produto 
SELECT produto.nome, SUM(producao.area_colhida) as area_colhida, producao.ano 
FROM agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id = producao.produto_id
--WHERE producao.produto_id = 103
GROUP BY produto.nome, producao.ano

--Por municipio
SELECT municipio.nome, SUM(producao.area_colhida) FROM core_municipio AS municipio 
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
WHERE producao.produto_id = 103
GROUP BY municipio.nome

--PRODUTO/MESO
SELECT produto.nome,mesoregiao.nome, SUM(producao.area_colhida) FROM core_municipio AS municipio
INNER JOIN core_microregiao AS microregiao ON municipio.microregiao_id = microregiao.id
INNER JOIN core_mesoregiao AS mesoregiao ON microregiao.id = mesoregiao.id
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
INNER JOIN agricultura_produto AS produto ON produto.id = producao.produto_id
GROUP BY mesoregiao.nome, produto.nome
ORDER BY mesoregiao.nome

--PRODUTO/MICRO
SELECT 
producao.ano, 
producao.mes, 
produto.nome as produto ,
microregiao.nome as microregiao, SUM(producao.area_colhida) as area_colhida FROM core_municipio AS municipio
INNER JOIN core_microregiao AS microregiao ON municipio.microregiao_id = microregiao.id
INNER JOIN core_mesoregiao AS mesoregiao ON microregiao.id = mesoregiao.id
INNER JOIN agricultura_producao AS producao ON municipio.id = producao.municipio_id
INNER JOIN agricultura_produto AS produto ON produto.id = producao.produto_id
GROUP BY microregiao.nome, produto.nome, producao.ano, producao.mes, mesoregiao.nome
ORDER BY microregiao.nome


--
SELECT produto.nome, SUM(producao.area_colhida) FROM agricultura_produto AS produto
INNER JOIN agricultura_producao AS producao ON produto.id =  producao.produto_id
GROUP BY produto.nome
ORDER BY produto.nome

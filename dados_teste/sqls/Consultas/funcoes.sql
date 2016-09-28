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

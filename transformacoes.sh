#!/bin/bash 

./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_estado.ktr"
./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_meso.ktr"
./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_micro.ktr"
./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_municipio.ktr"
./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_grupos.ktr"
./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_produto_subgrupo.ktr"
./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_producao.ktr"

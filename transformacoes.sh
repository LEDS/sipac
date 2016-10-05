#!/bin/bash 

./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_estado.ktr"
status_extrai_estado=$?
./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_meso.ktr"
status_extrai_meso=$?
./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_micro.ktr"
status_extrai_micro=$?
./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_municipio.ktr"
status_extrai_municipio=$?
./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_grupos.ktr"
status_extrai_grupos=$?
./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_produto_subgrupo.ktr"
status_extrai_produto_subgrupo=$?
./pan.sh -level=Minimal -file="/opt/pentaho/data-integration/samples/transformations/Sipac/extrai_producao.ktr"
status_extrai_producao=$?

if [[ $status_extrai_estado && $status_extrai_meso && $status_extrai_micro && $status_extrai_municipio && $status_extrai_grupos && $status_extrai_produto_subgrupo && $status_extrai_producao ]]; then
  exit 0
else
  exit 1
fi

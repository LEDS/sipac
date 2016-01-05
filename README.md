# Sipac-Backend

O  Projeto __SIPAC__ (Sistema de informações da produção agropecuária capixaba) irá possibilitar o melhor desempenho do planejamento e organização, pesquisa e extensão das atividades agropecuárias capixaba, bem como reduzirá o tempo que os pesquisadores e planejadores gastam com a busca e sistematização dos dados estatísticos.

Esse modulo é um serviço web que utiliza a arquitetura RestFull que permite aos __usuários externos ao Incaper e autorizados pelo mesmo__ consultem dados sobre a produção agropecuária do estado do Espírito Santo.

Esse modulo está organizado da seguite forma:
* __Dados de Teste__: essa pasta contém os dados utilizados para realizar teste no modulo. Através desses dados que as transformações foram desenvolvidas;
* __Transformações__: as transformações são as responsáveis por ler o conteúdo presente na pasta CVS da pasta Dados de Teste e salvar na banco de dados. Os transformadores foram criados utilizando a tecnologia [Data Integration (or Kettle)] (http://community.pentaho.com/projects/data-integration/) do Pentaho;
* __sipac__: serviço web

Para maiores detalhes sobre o projeto favor entrar no [site do projeto](http://leds.sr.ifes.edu.br/portfolio/sipac-sistema-de-informacoes-da-producao-agropecuaria-capixaba/) na página do [Leds](http://leds.sr.ifes.edu.br) e na wiki deste respositório. 

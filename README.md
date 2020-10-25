
# Manutenção de ciclo de vida / registo histórico de objetos em PostgreSQL - PostGIS

Este repositório contém uma série de exemplos de código SQL e DDL, específico para PostgreSQL, para gestão de ciclo de vida de objetos, registo e auditoria de alterações aos dados contidos em uma ou mais tabelas.

Não confundir estas operações de registo histórico e de alterações com operações de *versionamento de dados* (ver parágrafo sobre este tema mais abaixo).


Abordam-se aqui três níveis ou métodos de gestão de ciclo de vida, dois com registo na própria tabela e o restante com registo em tabelas de histórico / auditoria, uma por cada tabela "auditada":
- **auditoria básica**: mero registo de data/hora e responsável pela criação e alteração de objetos (não controlando apagamentos), na própria tabela;
- **"archiving"**: criação de registos *históricos* (registo integral da informação criada ou alterada -- atualizada ou apagada) na própria tabela, também com registo do momento e do responsável pela criação / alteração; inclui apagamento de registos;
- **"registo histórico" integral**: registo de todos dados criados, alterados e apagados, em tabelas de histórico, uma por cada tabela "principal" auditada.

Apenas os dois últimos métodos permitem implementar formas de "undo":  recuperar o estado anterior de um elemento ou mesmo o seu apagamento indesejado.

### Auditoria básica

Para

### Fora de âmbito - Versionamento

Por versionamento de dados entende-se aqui a marcação -- com um identificador de versão -- de um conjunto de registos de uma ou mais tabelas que possam estar a ser trabalhados em conjunto, por um operador ou equipa de trabalho. Com a ajuda desta marcação pretende-se identificar dados considerados incompletos ou inacabados e vedar o acesso aos mesmos pelos utilizadores habituais.

Uma vez que serão, na sua maioria, cópias atualizadas de objetos / registos já existentes, pretende-se que eles sejam registados nas mesmas tabelas.

É suposto estar em efeito um filtro que esconda dos utilizadores finais todos os registos que não pertençam à versão corrente. Quando os dados da nova versão estiverem completos, essa versão passa a ser a corrente e o dito filtro deverá ser alterado de forma a revelar apenas os novos elementos e esconder os das outras versões anteriores.

Esta forma de gestão de ciclo de vida de objetos é considerada demasiadamente complexa e com pouca utilidade real pelo que não é considerada nestas notas.



## Organização dos exemplos

| Exemplo  | Ficheiro |
| ---------------- | :------------------ |
| Auditoria básica | tracking_basico.sql |

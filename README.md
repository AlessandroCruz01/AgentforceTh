# AgentforceTh - Estudos de Desenvolvimento Salesforce

Repositorio para estudos praticos com os mais diversos temas de desenvolvimento Salesforce.

Objetivo: centralizar exemplos, experimentos e boas praticas para evolucao continua em Salesforce Platform.

## Temas cobertos

- Apex (triggers, classes, testes)
- Lightning Web Components (LWC)
- Aura Components
- Flows e automacoes
- Integracoes e APIs
- Metadata e organizacao de projeto com SFDX

## Estrategia de branches por tema

Cada tema deste repositorio sera organizado em uma branch dedicada.

- `main`: base estavel e documentacao geral
- `tema/apex`: estudos e exemplos de Apex
- `tema/lwc`: estudos e exemplos de Lightning Web Components
- `tema/flows`: estudos e exemplos de automacao com Flows

Padrao sugerido para novas branches:

- `tema/<assunto>`
- `feature/<tema>-<descricao-curta>`

Isso facilita a navegacao no GitHub e mantem os experimentos isolados por contexto.

## Estrutura do projeto

- force-app/main/default: metadados Salesforce (Apex, LWC, Aura, objetos etc.)
- manifest/package.xml: pacote para retrieve/deploy seletivo
- config/project-scratch-def.json: definicao de Scratch Org
- sfdx-project.json: configuracao principal do projeto

## Como usar

1. Instale Salesforce CLI.
2. Faca login na org:

```bash
sf org login web -a MinhaOrg
```

3. Liste orgs conectadas:

```bash
sf org list
```

4. Deploy para org alvo:

```bash
sf project deploy start -o MinhaOrg
```

5. Execute testes Apex:

```bash
sf apex run test -o MinhaOrg --result-format human
```

## Seguranca e boas praticas

- Nao versione tokens, credenciais, certificados ou chaves privadas.
- Use variaveis de ambiente para segredos locais.
- Revise diffs antes de push para evitar vazamento de dados da org.

## Publicacao no GitHub

Este repositorio foi preparado para ser publico.
Arquivos locais e sensiveis foram protegidos no [.gitignore](.gitignore).

## Referencias

- Salesforce Developers: https://developer.salesforce.com/
- Salesforce CLI Docs: https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/
- LWC Docs: https://developer.salesforce.com/docs/platform/lwc/overview

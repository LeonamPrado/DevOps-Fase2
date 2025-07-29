# Projeto DevOps na Prática: CI/CD com Node.js e IaC com Terraform

![Status do Pipeline de CI](https://github.com/[SEU_USUARIO_GITHUB]/[NOME_DO_SEU_REPOSITORIO]/actions/workflows/ci-pipeline.yml/badge.svg)

## 📖 Sobre o Projeto

Este repositório é o resultado prático da implementação de um fluxo de trabalho DevOps completo para uma aplicação Node.js. O foco principal não é a aplicação em si, mas a construção de uma fundação sólida de automação, integração contínua e infraestrutura como código, utilizando ferramentas modernas e práticas de mercado.

## ✨ Objetivos Principais

* **Integração Contínua (CI):** Garantir que cada alteração no código seja automaticamente testada e validada, mantendo a estabilidade da branch principal.
* **Qualidade de Código:** Automatizar a verificação de padrões e estilo de código com um linter (ESLint).
* **Infraestrutura como Código (IaC):** Versionar e gerenciar a infraestrutura na nuvem de forma declarativa e reprodutível com Terraform.

## 🛠️ Tecnologias Utilizadas

* **Aplicação:** Node.js
* **Gerenciador de Pacotes:** npm
* **Testes:** Jest
* **Linter:** ESLint
* **Controle de Versão:** Git & GitHub
* **Integração Contínua:** GitHub Actions
* **Infraestrutura como Código:** Terraform
* **Provedor de Nuvem:** AWS (Amazon Web Services)

## 🚀 Como Começar

Siga os passos abaixo para configurar e executar o projeto localmente.

### Pré-requisitos

Antes de começar, certifique-se de que você tem as seguintes ferramentas instaladas e configuradas em sua máquina:

* [Node.js](https://nodejs.org/en/) (v18.x ou superior)
* [Git](https://git-scm.com/)
* [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
* [AWS CLI](https://aws.amazon.com/cli/) com suas credenciais configuradas (`aws configure`)


### Comandos Úteis

* **Executar os testes:**
    ```sh
    npm test
    ```
* **Verificar a formatação do código (lint):**
    ```sh
    npm run lint
    ```

## ⚙️ Processos de Automação (DevOps)

### Pipeline de Integração Contínua (CI)

Este projeto utiliza **GitHub Actions** para automatizar o processo de CI. O workflow está definido no arquivo `.github/workflows/ci-pipeline.yml`.

O pipeline é acionado automaticamente a cada `push` ou `pull request` para a branch `main` e executa as seguintes etapas:
1.  **Checkout:** Baixa o código do repositório.
2.  **Setup Node.js:** Prepara o ambiente com a versão correta do Node.js.
3.  **Install Dependencies:** Instala as dependências com `npm install`.
4.  **Run Linter:** Verifica a qualidade e o estilo do código com `npm run lint`.
5.  **Run Tests:** Executa a suíte de testes com `npm test`.

Se qualquer etapa falhar, o pipeline é interrompido e o GitHub notifica a falha, protegendo a branch principal de código com problemas.

### Infraestrutura como Código (IaC)

A infraestrutura na nuvem é gerenciada pelo **Terraform**. Os scripts estão localizados na raiz do projeto.

* **Arquivo Principal:** `main.tf`
* **Recurso Provisionado:** Um bucket no AWS S3, destinado a armazenar artefatos de build futuramente.

#### Como executar o Terraform

**Importante:** Certifique-se de que suas credenciais da AWS estão configuradas corretamente.

1.  **Inicializar o Terraform** (baixa os plugins necessários):
    ```sh
    terraform init
    ```
2.  **Planejar as mudanças** (mostra o que será criado/alterado/destruído):
    ```sh
    terraform plan
    ```
3.  **Aplicar as mudanças** (cria a infraestrutura na AWS):
    ```sh
    terraform apply
    ```

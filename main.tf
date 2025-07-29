# main.tf

# Bloco 1: Configurações do próprio Terraform.
# Aqui dizemos que nosso projeto precisa do provedor "aws" da HashiCorp.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Usar uma versão recente do provedor AWS.
    }
  }
}

# Bloco 2: Configuração do Provedor.
# Aqui dizemos ao Terraform COMO se conectar à AWS.
# Ele usará as credenciais que você configurou no seu computador
# e criará os recursos na região especificada.
provider "aws" {
  region = "us-east-1" # Você pode mudar para a região de sua preferência.
}

# Bloco 3: Definição de Recursos (A "Receita").
# Este é o coração do arquivo. Aqui descrevemos o que queremos criar.
# resource "tipo_do_recurso" "nome_local_do_recurso" { ... }
resource "aws_s3_bucket" "artifacts_bucket" {
  # "bucket" é o nome REAL que o bucket terá na AWS.
  # ESTE NOME PRECISA SER GLOBALMENTE ÚNICO (nenhum outro usuário da AWS no mundo pode ter um bucket com o mesmo nome).
  # DICA: Use o nome do projeto + suas iniciais + data.
  bucket = "devops-projeto-js-seu-nome-20250728" # <-- MUDE ESTA LINHA PARA UM NOME ÚNICO!

  # "tags" são etiquetas para organizar e identificar seus recursos na AWS. É uma ótima prática!
  tags = {
    Name      = "Bucket para Artefatos do Projeto DevOps"
    Project   = "Projeto DevOps com JS"
    ManagedBy = "Terraform"
  }
}
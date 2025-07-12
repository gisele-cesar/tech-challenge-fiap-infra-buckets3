# Tech Challenge FIAP - Infraestrutura S3 Bucket (Versão Mínima)

Esta infraestrutura Terraform cria um bucket S3 seguro na AWS com as configurações essenciais de segurança.

## 🔒 Recursos de Segurança (Versão Mínima)

### ✅ O que está incluído:
- **Criptografia AES256**: Todos os dados são criptografados automaticamente
- **Bloqueio de acesso público**: Impede exposição acidental dos dados
- **Nome único**: Sufixo aleatório evita conflitos de nomes
- **Tags organizacionais**: Para identificação e gestão

### ❌ O que NÃO está incluído (para manter simplicidade):
- Versionamento de objetos
- Lifecycle policies
- Logging de acesso
- Criptografia KMS
- Políticas de bucket avançadas
- Múltiplos buckets

## 📁 Estrutura Simplificada

```
infra/terraform/
├── provider.tf      # Configuração do provider AWS
├── buckets3.tf     # Recursos do bucket S3 (4 recursos apenas)
├── variables.tf    # 2 variáveis opcionais
├── outputs.tf      # 3 outputs básicos
└── terraform.tfvars # Configuração simples
```

## 🏗️ Recursos Criados (Apenas 4)

1. **Random String**: Para nome único do bucket
2. **Bucket S3**: Container principal para dados
3. **Criptografia**: Configuração AES256 obrigatória
4. **Bloqueio Público**: Proteção contra acesso não autorizado

## 🚀 Como Usar (Simples)

### Pré-requisitos
- [Terraform](https://www.terraform.io/downloads.html) instalado
- [AWS CLI](https://aws.amazon.com/cli/) configurado
- Credenciais AWS válidas

### Deploy em 3 comandos:

```bash
# 1. Navegar para o diretório
cd infra/terraform

# 2. Inicializar
terraform init

# 3. Aplicar (será solicitada confirmação)
terraform apply
```

### Ou usar o script simplificado:

**Windows:**
```powershell
.\deploy-simple.ps1
# Escolha opção 1 (Mínima)
```

**Linux/Mac:**
```bash
./deploy-simple.sh
# Escolha opção 1 (Mínima)
```

## ⚙️ Configurações (Opcionais)

Você pode personalizar editando `terraform.tfvars`:

```hcl
# Nome base do bucket
bucket_base_name = "meu-projeto"

# Tags adicionais
additional_tags = {
  Owner = "MeuTime"
  Env   = "dev"
}
```

## 📊 Outputs

Após o deploy, você receberá:

- `bucket_name`: Nome completo do bucket criado
- `bucket_arn`: ARN do bucket para usar em políticas IAM
- `bucket_region`: Região onde o bucket foi criado

## 🛡️ Segurança Garantida

Mesmo sendo "mínima", esta configuração é segura para uso porque:

✅ **Criptografia obrigatória**: Todos os arquivos são criptografados  
✅ **Sem acesso público**: Impossível acessar via internet  
✅ **AWS Provider**: Usa as melhores práticas da AWS  
✅ **Infrastructure as Code**: Versionável e reproduzível  

## � Comandos Úteis

```bash
# Ver o que será criado
terraform plan

# Aplicar mudanças
terraform apply

# Ver informações do bucket
terraform output

# Destruir tudo
terraform destroy

# Formatar código
terraform fmt
```

## 💡 Quando Usar Esta Versão

### ✅ Ideal para:
- **Aprendizado** de Terraform e AWS S3
- **Protótipos** e provas de conceito
- **Projetos pequenos** com poucos dados
- **Testes** e desenvolvimento
- **Orçamento limitado**

### ❌ NÃO use para:
- Dados críticos de produção
- Compliance rigoroso
- Arquivos que precisam de versionamento
- Auditoria detalhada

## 🔄 Evolução

Quando precisar de mais recursos, você pode:

1. **Adicionar versionamento**: Proteção contra exclusão acidental
2. **Incluir lifecycle**: Reduzir custos movendo dados antigos
3. **Implementar logging**: Rastrear quem acessa os dados
4. **Usar KMS**: Criptografia com chaves gerenciadas

## 📞 Suporte

Se algo não funcionar:

1. Verifique se AWS CLI está configurado: `aws sts get-caller-identity`
2. Confirme que Terraform está instalado: `terraform version`
3. Veja se há erros: `terraform validate`

## 📜 Próximos Passos

1. **Deploy**: Execute o terraform apply
2. **Teste**: Faça upload de um arquivo via AWS CLI ou Console
3. **Explore**: Veja o bucket no console AWS
4. **Aprenda**: Tente adicionar versionamento depois

Esta versão é perfeita para começar! 🚀
Repo para criação da infra AWS bucket S3 para a entrega do tech-challenge FIAP fase 5.

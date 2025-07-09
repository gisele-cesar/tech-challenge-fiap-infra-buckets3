# Variáveis para infraestrutura S3 - Versão Mínima
# A versão mínima não precisa de muitas variáveis configuráveis

# Opcional: Se quiser customizar o nome base do bucket
# Por padrão usa "tech-challenge-fiap"
variable "bucket_base_name" {
  description = "Nome base para o bucket (será adicionado sufixo aleatório)"
  type        = string
  default     = "tech-challenge-fiap"
}

# Opcional: Tags adicionais
variable "additional_tags" {
  description = "Tags adicionais para o bucket"
  type        = map(string)
  default     = {
    Owner     = "DevOps"
    Team      = "Infrastructure"
    CreatedBy = "terraform"
  }
}

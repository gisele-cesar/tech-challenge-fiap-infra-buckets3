# Versão MÍNIMA - Bucket S3 Seguro
# Apenas o essencial para ter um bucket funcional e seguro

# Nome único para o bucket
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

# Bucket S3 principal
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_base_name}-${random_string.suffix.result}"

  tags = merge({
    Name        = "Tech Challenge FIAP Bucket - Fase 5"
    Project     = "tech-challenge-fiap"
    ManagedBy   = "terraform"
  }, var.additional_tags)
}

# Criptografia obrigatória (AES256)
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Bloquear todo acesso público
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
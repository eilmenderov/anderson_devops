provider "aws" {
	region = "us-east-2"
}

resource "aws_ecr_repository" "tg_bot_repo" {
  name = "tg-bot-repo" # Naming my repository
}

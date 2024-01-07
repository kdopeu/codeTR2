terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_group" "groupTR" {
  name = "admin"
}

resource "aws_iam_user" "userTR" {
  name = "kouekado"
  tags = {
    Team                 = "architecture"
    env                  = "Dev"
    cerated_by_terraform = "yes"
    Owner                = "kouekado"
    email                = "kdopeu71@gmail.com"
  }
}

output "group-arn" {
  value = aws_iam_group.groupTR.arn
}

output "user-arn" {
  value = aws_iam_user.userTR.arn
}

output "group-id" {
  value = aws_iam_group.groupTR.id
}

output "username" {
  value = aws_iam_user.userTR.name
}

output "user-tags" {
  value = aws_iam_user.userTR.tags_all
}
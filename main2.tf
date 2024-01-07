

resource "aws_iam_group" "admin_group" {
  name = "cloud"
}

resource "aws_iam_user" "user2" {
  name = "john2030"
}

resource "aws_iam_user_group_membership" "G_membership" {
  user   = aws_iam_user.user2.name
  groups = [aws_iam_group.admin_group.name]
}

resource "aws_iam_policy" "admin_policy" {
  name        = "admin-policy"
  description = "Administrator access policy"

  policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": "*",
          "Resource": "*"
        }
      ]
    }
  EOF
}

resource "aws_iam_policy_attachment" "admin_attachment" {
  name       = "admin-attachment"
  policy_arn = aws_iam_policy.admin_policy.arn
  groups     = [aws_iam_group.admin_group.name]
}

resource "aws_iam_group_membership" "team" {

  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user_one.name,
    aws_iam_user.user_two.name,
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "developers"
}

resource "aws_iam_user" "user_one" {
  name = "kaizen1"
}

resource "aws_iam_user" "user_two" {
  name = "kaizen2"
}

resource "aws_iam_user" "user3" {
  name = "hello"
}
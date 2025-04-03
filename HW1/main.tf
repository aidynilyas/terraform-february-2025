resource "aws_iam_group_membership" "team1" {

  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user1.name,
    aws_iam_user.user2.name,
    aws_iam_user.user3.name,
    aws_iam_user.user4.name,
    aws_iam_user.user10.name,
  ]

  group = aws_iam_group.group1.name
}

resource "aws_iam_group_membership" "team2" {

  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user5.name,
    aws_iam_user.user6.name,
    aws_iam_user.user7.name,
    aws_iam_user.user8.name,
    aws_iam_user.user9.name,
  ]

  group = aws_iam_group.group2.name
}

resource "aws_iam_group" "group1" {
  name = "blackpink"
}

resource "aws_iam_group" "group2" {
  name = "twice"
}

resource "aws_iam_user" "user1" {
  name = "jenny"
}

resource "aws_iam_user" "user2" {
  name = "rose"
}

resource "aws_iam_user" "user3" {
  name = "lisa"
}

resource "aws_iam_user" "user4" {
  name = "jisoo"
}

resource "aws_iam_user" "user5" {
  name = "jihyo"
}

resource "aws_iam_user" "user6" {
  name = "sana"
}

resource "aws_iam_user" "user7" {
  name = "momo"
}

resource "aws_iam_user" "user8" {
  name = "dahyun"
}

resource "aws_iam_user" "user9" {
  name = "mina"
}

resource "aws_iam_user" "user10" {
  name = "miyeon"
}
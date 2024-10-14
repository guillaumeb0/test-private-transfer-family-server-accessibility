data "aws_vpc" "main" {
  filter {
    name = "tag:Name"
    values = ["awesome-vpc"]
  }
}

# data "aws_availability_zones" "available" {
# }

output "zones" {
value = data.aws_availability_zones.available[2].names

}
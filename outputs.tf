output "aws_region" {
  value = data.aws_region.current
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.available
}

output "app_instance" {
  value = aws_lightsail_instance.instance
}

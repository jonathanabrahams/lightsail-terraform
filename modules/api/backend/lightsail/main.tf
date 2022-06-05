resource "aws_lightsail_static_ip" "backend" {
  name = "${var.instance_name}-ip"
}

resource "aws_lightsail_instance" "backend" {
  name              = "${var.instance_name}-instance"
  blueprint_id      = var.blueprint_id
  availability_zone = var.availability_zone
  bundle_id         = format("%s_%s", var.bundle_size, var.bundle_by_region[var.region])
}

resource "aws_lightsail_static_ip_attachment" "backend" {
  static_ip_name = aws_lightsail_static_ip.backend.id
  instance_name  = aws_lightsail_instance.backend.id
}

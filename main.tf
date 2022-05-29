resource "aws_lightsail_static_ip" "ipv4" {
  name = "${var.app}-ipv4"
}

resource "aws_lightsail_key_pair" "ssh" {
  name       = "${var.app}-ssh"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_lightsail_instance" "instance" {
  name              = "${var.app}-instance"
  blueprint_id      = var.blueprint_id
  availability_zone = data.aws_availability_zones.available.names[0]
  bundle_id         = "${var.bundle_size}_${var.bundle_by_region[data.aws_region.current.name]}"
  key_pair_name     = "${var.app}-ssh"

  connection {
    type        = "ssh"
    host        = self.public_ip_address
    user        = var.blueprint_users[var.blueprint_id]
    timeout     = "20s"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo update-alternatives --install /usr/bin/python python $(which python3) 40"
    ]
  }
}

resource "aws_lightsail_static_ip_attachment" "app_ipv4" {
  static_ip_name = aws_lightsail_static_ip.ipv4.id
  instance_name  = aws_lightsail_instance.instance.id
  provisioner "local-exec" {
    command = <<EOT
    sleep 30; cd ./ansible;
    >hosts;
    echo "[app]" | tee -a hosts;
    echo "${aws_lightsail_static_ip.ipv4.ip_address} ansible_user=${var.blueprint_users[var.blueprint_id]}" | tee -a hosts;
    export ANSIBLE_HOST_KEY_CHECKING=False;
    ansible-playbook upgrade-os.yaml -i hosts
    EOT
  }
}

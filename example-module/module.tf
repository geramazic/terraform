variable "command" {
  default = "echo 'Hello World'"
}

resource "null_resource" "null2" {
  provisioner "local-exec" {
    command = "${var.command}"
  }
}

module "network_vm" {
  source = "git::https://github.com/Chidu0665/Eval-3-Question.git"
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
}
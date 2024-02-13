variable "UERANSIM_VERSION" {
  default = "v3.2.6"
}

variable "UBUNTU_VERSION" {
  default = "jammy"
}

group "default" {
  targets = ["base-ueransim", "gnb", "ue"]
}

target "base-ueransim" {
  context = "./images/base-ueransim"
  tags = ["base-open5gs:${UERANSIM_VERSION}"]
  output = ["type=image"]
}

target "gnb" {
  context = "./images/gnb"
  contexts = {
    "base-ueransim:${UERANSIM_VERSION}" = "target:base-ueransim"
  }
  tags = ["gnb:${UERANSIM_VERSION}"]
  output = ["type=image"]
}

target "ue" {
  context = "./images/ue"
  contexts = {
    "base-ueransim:${UERANSIM_VERSION}" = "target:base-ueransim"
  }
  tags = ["ue:${UERANSIM_VERSION}"]
  output = ["type=image"]
}
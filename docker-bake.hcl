variable "UERANSIM_VERSION" {
  default = "v3.2.7"
}

variable "UBUNTU_VERSION" {
  default = "jammy"
}

group "default" {
  targets = ["base-ueransim", "gnb", "ue"]
}

target "base-ueransim" {
  args = {
    UBUNTU_VERSION = "${UBUNTU_VERSION}"
    UERANSIM_VERSION = "${UERANSIM_VERSION}"
  }
  context = "./images/base-ueransim"
  tags = ["base-ueransim:${UERANSIM_VERSION}"]
  output = ["type=image"]
}

target "gnb" {
  args = {
    UBUNTU_VERSION = "${UBUNTU_VERSION}"
    UERANSIM_VERSION = "${UERANSIM_VERSION}"
  }
  context = "./images/gnb"
  contexts = {
    "base-ueransim:${UERANSIM_VERSION}" = "target:base-ueransim"
  }
  tags = ["gnb:${UERANSIM_VERSION}"]
  output = ["type=image"]
}

target "ue" {
  args = {
    UBUNTU_VERSION = "${UBUNTU_VERSION}"
    UERANSIM_VERSION = "${UERANSIM_VERSION}"
  }
  context = "./images/ue"
  contexts = {
    "base-ueransim:${UERANSIM_VERSION}" = "target:base-ueransim"
  }
  tags = ["ue:${UERANSIM_VERSION}"]
  output = ["type=image"]
}

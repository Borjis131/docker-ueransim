# include docker-compose .env file
include .env

.PHONY: build-ueransim-base

build-base-ueransim:
	docker build --build-arg UBUNTU_VERSION=${UBUNTU_VERSION} --build-arg UERANSIM_VERSION=${UERANSIM_VERSION} -t base-ueransim:${UERANSIM_VERSION} ./images/base-ueransim
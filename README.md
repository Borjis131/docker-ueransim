# UERANSIM in Docker

UERANSIM gNB and UE images ready for Docker.

## Build it

>Note: Requires docker-buildx-plugin

To create the UERANSIM images run:
```bash
docker buildx bake
```

>Note: This command uses the `docker-bake.hcl` file, please update the `UERANSIM_VERSION` and `UBUNTU_VERSION` variables there before running it.

# Developer Documentation

## Prerequisites

Use a Linux virtual machine with Docker Engine, Docker Compose, GNU Make, and
an `/etc/hosts` entry mapping `aylaaouf.42.fr` to `127.0.0.1`. Create the data
directories and the local Portainer secret before starting.

The main configuration is in `srcs/.env`. Service Dockerfiles, configuration,
and startup scripts are under `srcs/requirements`.

## Build and Run

From the repository root, run `make hosts` once to add the domain to the host
machine's `/etc/hosts` file. Then run `make` or `make build` followed by `make
up`.
Compose can also be invoked directly with:

```sh
docker compose -f srcs/docker-compose.yml up -d --build
```

Use `make down` to stop services, `make logs` to follow logs, and `make fclean`
to remove containers, volumes, images, and local application data.

## Storage

MariaDB data is stored in `/home/aylaaouf/data/db_data` and WordPress files in
`/home/aylaaouf/data/wordpress_data`. The Portainer named volume stores its
own data in Docker-managed storage. These locations persist across container
recreation.

## Troubleshooting

Check `docker compose -f srcs/docker-compose.yml config` for Compose errors,
then inspect service logs. If the domain does not resolve, verify `/etc/hosts`,
the `DOMAIN_NAME` value, and that port 443 is available.
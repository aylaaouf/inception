*This project has been created as part of the 42 curriculum by aylaaouf.*

# Inception

## Description

Inception deploys a WordPress site with Docker Compose. The stack is built from
Debian Bookworm and contains NGINX with TLS, WordPress with PHP-FPM, and
MariaDB. Bonus services provide Redis caching, FTP access, Adminer, Portainer,
and a static resume site.

Docker isolates each service in its own container and connects them through the
`inception` bridge network. WordPress and MariaDB data persist in named Docker
volumes backed by `/home/aylaaouf/data`.

Virtual machines include a complete guest operating system for each VM, while
Docker containers share the host kernel and are lighter and faster to start.
Docker secrets are intended for confidential values; environment variables are
better suited to non-secret configuration such as the domain name. The project
uses both mechanisms for their respective purposes.

A Docker bridge network provides private service-to-service communication and
service discovery. Host networking removes that isolation and is not used here.
Docker volumes are managed persistent storage, while bind mounts expose an
explicit host path and require more host-side management.

## Instructions

Create the local secret file `secrets/portainer_password.txt`, configure
`srcs/.env`, and ensure `/home/aylaaouf/data` is writable by Docker. Map
`aylaaouf.42.fr` to `127.0.0.1` in `/etc/hosts`.

From the repository root. The first command adds the local domain to the host
machine's `/etc/hosts` file when it is missing:

```sh
make hosts
make
```

Open `https://aylaaouf.42.fr`. Bonus services are available on ports 9443,
6060, 8080, and FTP ports 21/40000-40010.

Useful commands are `make down`, `make logs`, and `make fclean`.

## Resources

- Docker Compose documentation: https://docs.docker.com/compose/
- Docker volumes: https://docs.docker.com/engine/storage/volumes/
- NGINX documentation: https://nginx.org/en/docs/
- WordPress CLI documentation: https://developer.wordpress.org/cli/commands/
- MariaDB documentation: https://mariadb.com/kb/en/documentation/

AI was used to review the implementation against the subject, identify
configuration risks, and suggest focused corrections. All changes were checked
against the local files and validated with Docker Compose and shell syntax
checks.
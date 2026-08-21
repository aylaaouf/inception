# User Documentation

## Services

NGINX serves the WordPress website over HTTPS. WordPress runs PHP-FPM,
MariaDB stores its database, and Redis provides caching. The bonus services are
Adminer for database administration, Portainer for Docker administration, FTP
for WordPress files, and a static resume website.

## Start and Stop

Run `make` from the repository root to build and start the stack. Run `make
down` to stop it and `make logs` to inspect service output.

## Access

- Website: `https://aylaaouf.42.fr`
- WordPress administration: `https://aylaaouf.42.fr/wp-admin`
- Portainer: `https://localhost:9443`
- Adminer: `http://localhost:6060`
- Resume: `http://localhost:8080`

## Credentials

Credentials are kept locally in `srcs/.env` and `secrets/`. Never commit these
files. Change passwords by editing the local files and recreate the affected
containers and volumes when a fresh database is required.

## Health Checks

Use `docker compose -f srcs/docker-compose.yml ps` and
`docker compose -f srcs/docker-compose.yml logs SERVICE`. The website should
respond on port 443 and the WordPress, MariaDB, and NGINX containers should be
running.
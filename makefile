dev:
#	cp caddy/prod.Caddyfile caddy/Caddyfile
	cp docker-compose.local.yml docker-compose.yml
	docker-compose up -d

prod:
#	cp caddy/prod.Caddyfile caddy/Caddyfile
	cp docker-compose.prod.yml docker-compose.yml
	docker-compose up

go:
	docker-compose up

go2:
	docker-compose up --build

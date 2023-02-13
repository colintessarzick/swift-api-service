compose-up:
	docker compose up -d --remove-orphans

compose-down:
	docker compose down --remove-orphans

compose-new:
	docker compose up -d --build --remove-orphans

prune: compose-down
	docker container prune -f
	docker image prune -f

build:
	swift build

run:
	swift run Run serve

unittest:
	swift test

compose-up:
	docker compose up -d

compose-down: prune
	docker compose down

compose-new:
	docker compose up -d --build

prune:
	docker container prune -f
	docker image prune -f

build:
	swift build

run:
	swift run Run serve

unittest:
	swift test

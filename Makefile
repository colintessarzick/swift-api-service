compose-up:
	docker compose up -d --remove-orphans

compose-down:
	docker compose down --remove-orphans

compose-new: generate-requirements
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

# ------------------------------
# Python
# ------------------------------

generate-requirements:
	poetry export --without-hashes --format=requirements.txt > requirements.txt

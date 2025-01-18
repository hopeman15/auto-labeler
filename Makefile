lint:
	shellcheck src/*.sh test/*.bats
.PHONY: lint

test:
	bats test/*.bats
.PHONY: test

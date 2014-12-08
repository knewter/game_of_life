all: dialyze test

.PHONY: dialyze
dialyze:
	mix compile
	dialyzer _build/dev/lib/game_of_life/ebin

.PHONY: test
test:
	mix test

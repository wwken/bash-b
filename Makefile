.PHONY: itests tests

itests:
	ZDOTDIR="${PWD}/tests" cram -i --shell=bash tests

tests:
	ZDOTDIR="${PWD}/tests" cram --shell=bash tests

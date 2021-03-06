WITH_ENV = env `cat .env 2>/dev/null | xargs`


install-deps:
	@$(MAKE) pip

pre-commit:
	@cp ./scripts/pre-commit .git/hooks/

pip:
	@make pre-commit
	@pip --default-timeout=100 --retries=5 install -r requirements/requirement.txt
	@pip --default-timeout=100 --retries=5 install -r requirements/requirement-dev.txt
	@pip --default-timeout=100 --retries=5 install -r requirements/requirement-test.txt

lint:
	@sh scripts/check_lint.sh

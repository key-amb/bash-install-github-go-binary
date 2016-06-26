.PHONY: doc release

BIN     := bin/install-github-go-binary
VERSION := $(shell $(BIN) -v)

README.md: $(BIN)
	pod2markdown $(BIN) > README.md

doc: README.md

release: doc
	git commit -m $(VERSION)
	git tag -a v$(VERSION) -m $(VERSION)
	git push origin v$(VERSION)
	git push origin master

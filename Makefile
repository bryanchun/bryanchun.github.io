generate:
	@ yq eval --output-format=json resume.yaml > resume.json

test: generate
	@ resume validate

build: generate
	@ resume export resume.html
	@ # Hack for customizing the theme without having to fork a new json resume theme
	@ sed -i \
		-e 's/--color-accent: \(.*\);/--color-accent: #336677;/' \
		-e 's/--color-link: \(.*\);/--color-link: #1eaedb;/' \
		-e 's/--color-background: \(.*\);/--color-background: #f0edea;/' \
		resume.html

deploy: build
	@ cp resume.html index.html

.PHONY: generate test build deploy

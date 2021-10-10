generate:
	@ yq eval --output-format=json resume.yaml | cat >resume.json

test: generate
	@ resume validate

build: generate
	@ resume export resume.html
	@ # Hack for customizing the theme without having to fork a new json resume theme
	@ # Note: For color background, we only want to fix the first occruence only for the light theme, keeping the dark theme one untouched
	@ sed -i \
		-e 's/--color-accent: \(.*\);/--color-accent: #336677;/' \
		-e 's/--color-link: \(.*\);/--color-link: #1eaedb;/' \
		-e '0,/--color-background:/{s/--color-background: \(.*\);/--color-background: #f0edea;/}' \
		resume.html

deploy: build
	@ cp resume.html index.html

.PHONY: generate test build deploy

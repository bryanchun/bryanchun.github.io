generate:
	@ yq eval --output-format=json resume.yaml | cat >resume.json

test: generate
	@ resume validate

build: generate
	@ resume export resume.html
	@ # Hack for customizing the theme without having to fork a new json resume theme
	@ # Note: For color background, we only want to fix the first occruence only for the light theme, keeping the dark theme one untouched

deploy: build
	@ cp resume.html index.html

.PHONY: generate test build deploy

generate-js: deps
	@find src -name '*.coffee' | xargs coffee -c -o lib
	@ln -sf src/riak.desc lib

remove-js:
	@rm -fr lib/

deps:
	@test `which coffee` || echo 'You need to have CoffeeScript in your PATH.\nPlease install it using `brew install coffee-script` or `npm install coffee-script`.'

test: deps
	@find test -name '*.coffee' | xargs ls

publish: generate-js
	@test `which npm` || echo 'You need npm to do npm publish... makes sense?'
	npm publish
	@remove-js

.PHONY: generate-js remove-js deps test publish
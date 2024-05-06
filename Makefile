DEFAULT_GOAL := help
help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-27s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: openai-install
openai-install: ## Install the OpenAI library.
	npm install --save openai

.PHONY: test-chat-completions
test-chat-completions: ## OpenAI Chat Completions example. Syntax: `make test-chat-completions OPENAI_API_KEY=<key>`
	node openai-test-chat-completions.mjs

.PHONY: test-embeddings
test-embeddings: ## OpenAI Embeddings example. Syntax: `make test-embeddings OPENAI_API_KEY=<key>`
	node openai-test-embeddings.mjs

./PHONY: test-images
test-images: ## OpenAI Images example. Syntax: `make test-images OPENAI_API_KEY=<key>`
	node openai-test-images.mjs

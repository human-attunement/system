SHELL := /bin/bash

.PHONY: help build-honkit release tag-at render-mermaid-svg render-mermaid-png build-pdf release-pdf publish-pdf release-pdf-publish release-all

help:
	@echo "Available targets:"
	@echo "  build-honkit          - bash scripts/build_honkit.sh"
	@echo "  release               - bash scripts/release.sh"
	@echo "  tag-at                - bash scripts/tag_at.sh"
	@echo "  render-mermaid-svg    - MERMAID_CONFIG=./mermaid-config.json MERMAID_FORMAT=svg ./scripts/render-mermaid.sh"
	@echo "  render-mermaid-png    - MERMAID_CONFIG=./mermaid-config.json MERMAID_FORMAT=png MERMAID_WIDTH=1200 ./scripts/render-mermaid.sh"
	@echo "  build-pdf             - bash scripts/quarto_build.sh"
	@echo "  release-pdf           - bash scripts/quarto_build.sh --release --tag"
	@echo "  publish-pdf           - bash scripts/quarto_build.sh --publish"
	@echo "  release-pdf-publish   - bash scripts/quarto_build.sh --release --tag --publish"
	@echo "  release-all           - Release with tag and PDF generation (usage: make release-all VERSION=X.Y.ZZ)"

build-honkit:
	bash scripts/build_honkit.sh

release:
	bash scripts/release.sh

tag-at:
	bash scripts/tag_at.sh

render-mermaid-svg:
	MERMAID_CONFIG=./mermaid-config.json MERMAID_FORMAT=svg ./scripts/render-mermaid.sh

render-mermaid-png:
	MERMAID_CONFIG=./mermaid-config.json MERMAID_FORMAT=png MERMAID_WIDTH=1200 ./scripts/render-mermaid.sh

build-pdf:
	bash scripts/quarto_build.sh

release-pdf:
	bash scripts/quarto_build.sh --release --tag

publish-pdf:
	bash scripts/quarto_build.sh --publish

release-pdf-publish:
	bash scripts/quarto_build.sh --release --tag --publish

release-all:
	@if [ -z "$(VERSION)" ]; then \
		echo "Error: VERSION is required. Usage: make release-all VERSION=X.Y.ZZ"; \
		exit 1; \
	fi
	bash scripts/release.sh $(VERSION)
	bash scripts/quarto_build.sh --release --tag

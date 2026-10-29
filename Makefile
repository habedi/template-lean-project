# Variables
PACKAGE_NAME := template-lean-project
BINARY_NAME := template-lean-project
export PATH := $(HOME)/.elan/bin:$(PATH)
LAKE := $(shell command -v lake 2>/dev/null || (command -v elan >/dev/null 2>&1 && elan which lake 2>/dev/null) || echo "lake")
ELAN := $(shell command -v elan 2>/dev/null || echo "elan")
ASSET_DIR := docs/assets
SHELL := /bin/bash

# Default target
.DEFAULT_GOAL := help

.PHONY: help
help: ## Show help messages for all available targets
	@grep -E '^[a-zA-Z_-]+:.*## .*$$' $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## Build the Lean project and default executable
	@echo "Building $(PACKAGE_NAME)..."
	@$(LAKE) build

.PHONY: test
test: ## Run the Lean test suite
	@echo "Running tests..."
	@$(LAKE) test

.PHONY: run
run: ## Run the main entry point (Main.lean) in the Lake environment
	@echo "Running Main.lean..."
	@$(LAKE) env lean --run Main.lean

.PHONY: cache-get
cache-get: ## Download precompiled Mathlib build cache
	@echo "Fetching Mathlib build cache..."
	@$(LAKE) exe cache get

.PHONY: check
check: ## Verify build targets and test driver configuration
	@echo "Checking Lake build and test configuration..."
	@$(LAKE) check-build
	@$(LAKE) check-test

.PHONY: lint
lint: ## Build with warnings treated as errors
	@echo "Linting Lean sources..."
	@$(LAKE) --wfail build

.PHONY: update
update: ## Update package dependencies and manifest
	@echo "Updating dependencies..."
	@$(LAKE) update

.PHONY: clean
clean: ## Remove package build artifacts
	@echo "Cleaning build artifacts..."
	@$(LAKE) clean «template-lean-project»
	@rm -rf .lake/build/lib/TemplateLeanProject* .lake/build/ir/TemplateLeanProject* .lake/build/lib/Tests* .lake/build/ir/Tests*

.PHONY: install-deps
install-deps: ## Install elan (Lean toolchain manager)
	@echo "Checking for elan..."
	@if command -v elan >/dev/null 2>&1; then \
		echo "elan is already installed: $$(elan --version)"; \
	else \
		echo "Installing elan..."; \
		curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh | sh -s -- -y; \
		echo "Please add $$HOME/.elan/bin to your PATH or restart your shell."; \
	fi

.PHONY: docs
docs: ## Build documentation (requires doc-gen4 in lakefile)
	@echo "Building documentation..."
	@$(LAKE) build :docs || echo "Note: doc-gen4 requires configuration in lakefile.lean"

.PHONY: figs
figs: ## Generate figures from .dot files in the assets directory
	@echo "Generating figures..."
	@if [ -f $(ASSET_DIR)/make_figures.sh ]; then \
		$(SHELL) $(ASSET_DIR)/make_figures.sh $(ASSET_DIR); \
	fi

.PHONY: setup-hooks
setup-hooks: ## Install Git pre-commit hooks
	@echo "Setting up Git hooks..."
	@if ! command -v pre-commit >/dev/null 2>&1; then \
		echo "pre-commit not found. Please install it using 'pip install pre-commit' or via your package manager."; \
		exit 1; \
	fi
	@pre-commit install --hook-type pre-commit
	@pre-commit install --hook-type pre-push

.PHONY: test-hooks
test-hooks: ## Test Git hooks on all tracked files
	@echo "Running Git hooks on all files..."
	@pre-commit run --all-files --show-diff-on-failure

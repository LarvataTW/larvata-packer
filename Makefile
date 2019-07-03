# Using bash
SHELL := /bin/bash

# One worker at the time
MAKEFLAGS = --jobs=1

PLUGIN_DIR=$(HOME)/.packer.d/plugins

.PHONY: init
init: ## 初始化 Packer 運作環境
	brew install packer
	cp -iv .env.example .env
	$(MAKE) plugin

.PHONY: plugins
plugin: ## 安裝 Packer Plugin
	mkdir -p ${PLUGIN_DIR}
	curl -L https://github.com/jetbrains-infra/packer-builder-vsphere/releases/download/v2.3/packer-builder-vsphere-clone.macos -o ${PLUGIN_DIR}/packer-builder-vsphere-clone
	curl -L https://github.com/jetbrains-infra/packer-builder-vsphere/releases/download/v2.3/packer-builder-vsphere-iso.macos -o ${PLUGIN_DIR}/packer-builder-vsphere-iso
	chmod a+x ${PLUGIN_DIR}/*

# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

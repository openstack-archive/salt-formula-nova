#!/usr/bin/make

MAKEFILE_PATH	:= $(abspath $(lastword $(MAKEFILE_LIST)))
MAKEDIR			:= $(notdir $(patsubst %/,%,$(dir $(MAKEFILE_PATH))))

# Overrideable parameters
BUILDDIR      ?= ${MAKEDIR}/build
VENV_DIR      ?= ${BUILDDIR}/virtualenv
SALT_FILE_DIR ?= ${BUILDDIR}/file_root
SALT_PILLAR_DIR ?= ${BUILDDIR}/pillar_root
SALT_VERSION  ?=

ifndef SALT_VERSION
	PIP_SALT_VERSION :=
else
	PIP_SALT_VERSION := "==${SALT_VERSION}"
endif

test: setup-virtualenv setup-salt
	@echo test

setup-salt:
	@echo "Setting up Salt environment"
	(test -d ${SALT_FILE_DIR} || \
		mkdir -p ${SALT_FILE_DIR})
	(test -d ${SALT_PILLAR_DIR} || \
		mkdir -p ${SALT_PILLAR_DIR})


setup-virtualenv:
	@echo "Setting up Python virtualenv"
	(test -d ${BUILDDIR} || \
		mkdir -p ${BUILDDIR})
	virtualenv ${VENV_DIR}
	@echo "Installing Salt ${PIP_SALT_VERSION}"
	(. ${BUILDDIR}/virtualenv/bin/activate && \
		pip install salt${PIP_SALT_VERSION})

clean:
	@echo "Cleaning up ${BUILDDIR}"
	rm -rf ${BUILDDIR}


.PHONY: book 

# NUM_THREADS := 4
KERNEL_NAME := julia_jupyterbook_kernel
# Get Julia verision without the last version entry. (e.g. 1.11)
FULL_VERSION := $(shell julia --version | awk '{print $$3}')
VERSION := $(shell julia --version | awk '{split($$3, a, "."); print a[1]"."a[2]}')
JUPYTER_VAR := $(shell which jupyter)

# IJulia appends the version to whatever name we give it
IJULIA_KERNEL_NAME := $(KERNEL_NAME)-$(VERSION)
IJULIA_INSTALL_DIR := $(HOME)/.local/share/jupyter/kernels/$(IJULIA_KERNEL_NAME)

SCRIPT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
LOCAL_INSTALL_DIR := $(SCRIPT_DIR)/venv/share/jupyter/kernels

#	# cp -r "$(IJULIA_INSTALL_DIR)" "$(LOCAL_INSTALL_DIR)"

html:
	sh patch_kernel_versions.sh "$(FULL_VERSION)" "$(IJULIA_KERNEL_NAME)"
	julia -e 'using Pkg; Pkg.build("IJulia"); using IJulia; installkernel("$(KERNEL_NAME)")'
	jupyter-book build book/

clean: book/_build
	echo "Removing everything under _build"
	rm -rf book/_build

CURDIR := $(shell pwd)

srctree := $(CURDIR)

export srctree

HOSTCC  	= gcc
HOSTCXX  	= g++
HOSTCFLAGS	:=
HOSTCXXFLAGS	:=

export HOSTCC HOSTCXX HOSTCFLAGS HOSTCXXFLAGS

# We need some generic definitions
include $(srctree)/scripts/Kbuild.include

PHONY := all

all:

PHONY += scripts_basic
scripts_basic:
	$(Q)$(MAKE) $(build)=scripts/basic


%config: scripts_basic FORCE
	$(Q)mkdir -p include
	$(Q)$(MAKE) $(build)=scripts/kconfig $@

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)

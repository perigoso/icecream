APP_NAME = icecream

# Directories
TARGETDIR = bin
SOURCEDIR = src
INSTALLDIR = /usr/local/bin
OBJECTDIR = bin/obj
INCLUDEDIR = include

STRUCT := $(shell find $(SOURCEDIR) -type d)

SOURCEDIRSTRUCT := $(filter-out %/$(INCLUDEDIR), $(STRUCT))
INCLUDEDIRSTRUCT := $(filter %/$(INCLUDEDIR), $(STRUCT))
OBJECTDIRSTRUCT := $(subst $(SOURCEDIR), $(OBJECTDIR), $(SOURCEDIRSTRUCT))

# Compillers
CC = gcc
CXX = g++

# Compiller flags
CFLAGS = $(addprefix -I,$(INCLUDEDIRSTRUCT)) -Wall -std=gnu11
CXXFLAGS = $(addprefix -I,$(INCLUDEDIRSTRUCT)) -Wall -std=gnu++11

LDLIBS = -ludev -lusb-1.0

# Sources & objects
SRCFILES := $(addsuffix /*, $(SOURCEDIRSTRUCT))
SRCFILES := $(wildcard $(SRCFILES))

CSOURCES := $(filter %.c, $(SRCFILES))
COBJECTS := $(subst $(SOURCEDIR), $(OBJECTDIR), $(CSOURCES:%.c=%.o))

CXXSOURCES := $(filter %.cpp, $(SRCFILES))
CXXOBJECTS := $(subst $(SOURCEDIR), $(OBJECTDIR), $(CXXSOURCES:%.cpp=%.o))

SOURCES = $(ASSOURCES) $(CSOURCES) $(CXXSOURCES)
OBJECTS = $(ASOBJECTS) $(COBJECTS) $(CXXOBJECTS)

DEPENDENCIES = $(OBJECTS:.o=.d)

# Target
TARGET = $(TARGETDIR)/$(APP_NAME)

all: make-obj-dir $(TARGET)

$(TARGET): $(OBJECTS)
	@echo Compiling App \'$@\'...
	@$(CXX) -o $@ $(OBJECTS) $(CXXFLAGS) $(LDLIBS)

$(OBJECTDIR)/%.o: $(SOURCEDIR)/%.c
	@echo Compilling C file \'$<\' \> \'$@\'...
	@$(CC) $(CFLAGS) -c -o $@ $<

$(OBJECTDIR)/%.o: $(SOURCEDIR)/%.cpp
	@echo Compilling C++ file \'$<\' \> \'$@\'...
	@$(CXX) $(CXXFLAGS) -c -o $@ $<

make-obj-dir:
	@mkdir -p $(OBJECTDIRSTRUCT)

install: all
	@mkdir -p $(INSTALLDIR)
	@echo Installing $(APP_NAME) in $(INSTALLDIR)...
	@cp $(TARGET) $(INSTALLDIR)

uninstall:
	@echo Removing $(APP_NAME) from $(INSTALLDIR)...
	@rm -f $(INSTALLDIR)/$(APP_NAME)

clean:
	@rm -rf $(OBJECTDIR)/*

.PHONY: all make-obj-dir install uninstall clean

-include $(DEPENDENCIES)

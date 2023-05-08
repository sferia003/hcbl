# set the Haskell compiler to use
GHC = ghc

# set the flags to pass to the compiler
GHC_FLAGS = -Wall

# set the name of the executable to generate
EXECUTABLE = test_program

# set the source directory and extension
SRC_TYPES = types
SRC_LIB = lib
SRC_EXT = hs

# set the source files to compile
SRC_FILES = $(wildcard *.$(SRC_EXT))

SRC_FILES += $(wildcard $(SRC_TYPES)/*.$(SRC_EXT))

SRC_FILES += $(wildcard $(SRC_LIB)/*.$(SRC_EXT))

# the default target to build
default: $(EXECUTABLE)

# rule to build the executable
$(EXECUTABLE): $(SRC_FILES)
	$(GHC) $(GHC_FLAGS) -o $@ $^

# rule to clean up generated files
.PHONY: clean
clean:
	rm -f $(EXECUTABLE) **/*.o **/*.hi *.o *.hi


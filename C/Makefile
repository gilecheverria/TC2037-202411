# Makefile to compile several simple programs

### Variables for this project ###
# These should be the only ones that need to be modified
# The files that must be compiled, with a .o extension
#OBJECTS = shared_variables.o
# The header files
#DEPENDS =
# The executable programs to be created
PROGRAMS = \
	01_threads \
	02_sums \
	03_mutex \
	04_faster \
	factorial

### Variables for the compilation rules ###
# These should work for most projects, but can be modified when necessary
# The compiler program to use
CC = gcc
# Options to use when compiling object files
# NOTE the use of gnu11, because otherwise the socket structures are not included
#  http://stackoverflow.com/questions/12024703/why-cant-getaddrinfo-be-found-when-compiling-with-gcc-and-std-c99
CFLAGS = -Wall -g -std=gnu11 -pedantic # -O2
# Options to use for the final linking process
# This one links the pthreads library
LDLIBS = -lpthread

### The rules ###
# These should work for most projects without change
# Special variable meanings:
#   $@  = The name of the rule
#   $^  = All the requirements for the rule
#   $<  = The first required file of the rule

# Default rule
all: $(PROGRAMS)

# Rule to make the client program
$(PROGRAM): $(PROGRAM).o $(OBJECTS)
	$(CC) $^ -o $@ $(LDFLAGS) $(LDLIBS)

# Rule to make the object files
%.o: %.c $(DEPENDS)
	$(CC) $< -c -o $@ $(CFLAGS)

# Clear the compiled files
clean:
	rm -rf *.o $(PROGRAMS)

# Create a zip with the source code of the project
# Useful for submitting assignments
# Will clean the compilation first
zip: clean
	zip -r $(MAIN).zip *

# Indicate the rules that do not refer to a file
.PHONY: clean all zip

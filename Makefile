.PHONY: all debug release test clean

# Programs
CC=gcc
LEX=flex
YACC=bison
RM=rm -f

# CC Flags
C_STD=c11
CFLAGS=-D_XOPEN_SOURCE=700
CC_DEBUG_FLAGS=-Wall --std=$(C_STD) -g
CC_RELEASE_FLAGS=-Wall --std=$(C_STD) -O2

# Yacc Flags
YACC_FLAGS=-Wall -l
YACC_DEBUG_FLAGS=-dvtg
YACC_RELEASE_FLAGS=-dvt

# Files
FILES=color.h

# Lexer Files
LEX_FILES=lexer.l
LEX_SUFFIX=.l
LEX_C_SUFFIX=.yy.c
LEX_C_FILES=$(LEX_FILES:$(LEX_SUFFIX)=$(LEX_C_SUFFIX))

# Parser Files
YACC_FILES=parser.y
YACC_SUFFIX=.y
YACC_C_SUFFIX=.tab.c
YACC_H_SUFFIX=.tab.h
YACC_C_FILES=$(YACC_FILES:$(YACC_SUFFIX)=$(YACC_C_SUFFIX))
YACC_H_FILES=$(YACC_FILES:$(YACC_SUFFIX)=$(YACC_H_SUFFIX))

# Output Program Name
EXECUTABLE_NAME=homework1

# Compile and Test Input
all: release test

# Create Release Build
release:
	@echo -e "[1/3] Generating parser..."
	$(YACC) $(YACC_FLAGS) $(YACC_RELEASE_FLAGS) $(YACC_FILES)
	@echo -e "[2/3] Generating lexer..."
	$(LEX) -o $(LEX_C_FILES) $(LEX_FILES)
	@echo -e "[3/3] Generating release build..."
	$(CC) $(CFLAGS) $(CC_RELEASE_FLAGS) $(FILES) $(LEX_C_FILES) $(YACC_C_FILES) -o $(EXECUTABLE_NAME)

# Create Debug Build
debug:
	@echo -e "[1/3] Generating parser..."
	$(YACC) $(YACC_FLAGS) $(YACC_DEBUG_FLAGS) $(YACC_FILES)
	@echo -e "[2/3] Generating lexer..."
	$(LEX) -o $(LEX_C_FILES) $(LEX_FILES)
	@echo -e "[3/3] Generating debug build..."
	$(CC) $(CFLAGS) $(CC_DEBUG_FLAGS) $(FILES) $(LEX_C_FILES) $(YACC_C_FILES) -o $(EXECUTABLE_NAME)

# Test With Input and Close Program
test:
	@echo -e "[1/1] Executing program..."
	./$(EXECUTABLE_NAME)

# Clean Build Files
clean:
	@echo -e "[1/1] Cleaning build files..."
	$(RM) $(LEX_C_FILES) $(YACC_C_FILES) $(YACC_H_FILES) $(YACC_FILES:.y=.output) $(YACC_FILES:.y=.dot) $(EXECUTABLE_NAME)

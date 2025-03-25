# Compiler.
CXX = g++

# Compiler flags.
CXXFLAGS = -Wall -Wextra -std=c++17 -O3

# Source and header files.
SRC_DIR = src
SRCS = $(wildcard $(SRC_DIR)/*.cc)
HEADERS = $(wildcard $(SRC_DIR)/*.h)

# Flute files.
FLUTE_SRC_DIR = src/flute
FLUTE_OBJ = $(FLUTE_SRC_DIR)/flute.o

INCLUDE = -I$(SRC_DIR) -I$(FLUTE_SRC_DIR)

# Output directory.
BIN_DIR = bin
# Output executable.
EXEC = steiner
TARGET = $(BIN_DIR)/$(EXEC)

# Object files.
OBJS = $(SRCS:.cc=.o) $(FLUTE_OBJ)

# Default target.
all: $(TARGET)

# Link object files to create the executable.
$(TARGET): $(OBJS) | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -o $@ $^ -lm

# Create bin directory if it doesn't exist.
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Compile source files into object files.
%.o: %.cc $(HEADERS)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

# Compile Flute separately.
$(FLUTE_SRC_DIR)/flute.o: $(FLUTE_SRC_DIR)/flute.c $(FLUTE_SRC_DIR)/flute.h
	gcc -O3 -c $(FLUTE_SRC_DIR)/flute.c -o $@

# Clean up build files.
clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: all clean

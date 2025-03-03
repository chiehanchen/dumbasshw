# Compiler.
CXX = g++

# Compiler flags.
CXXFLAGS = -Wall -Wextra -std=c++17 -O3

# Source and header files.
SRC_DIR = src
SRCS = $(wildcard $(SRC_DIR)/*.cc)
HEADERS = $(wildcard $(SRC_DIR)/*.h)

INCLUDE = $(SRC_DIR)

# Output directory.
BIN_DIR = bin
# Output executable.
EXEC = steiner
TARGET = $(BIN_DIR)/$(EXEC)

# Object files.
OBJS = $(SRCS:.cc=.o)

# Default target.
all: $(TARGET)

# Link object files to create the executable.
$(TARGET): $(OBJS) | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE) -o $@ $^
	
# Create bin directory if it doesn't exist.
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Compile source files into object files.
%.o: %.cc $(HEADERS)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE) -c $< -o $@

# Clean up build files.
clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: all clean

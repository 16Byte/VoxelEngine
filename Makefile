# Compiler
CXX = clang++

# Compiler flags
CXXFLAGS = -std=c++11 -Wall -Wextra -I/opt/homebrew/include

# Raylib flags for macOS
LDFLAGS = -L/opt/homebrew/lib -framework CoreVideo -framework IOKit -framework Cocoa -framework GLUT -framework OpenGL
LDLIBS = -lraylib

# Directories
SRC_DIR = .
BUILD_DIR = build

# Source and target
SRC = main.cpp
TARGET = voxel_engine

# Default target
all: $(BUILD_DIR) $(TARGET)

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Build target
$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $(SRC) -o $(BUILD_DIR)/$(TARGET) $(LDFLAGS) $(LDLIBS)

# Run the program
run: $(TARGET)
	./$(BUILD_DIR)/$(TARGET)

# Clean build files
clean:
	rm -rf $(BUILD_DIR)

# Rebuild
rebuild: clean all

.PHONY: all run clean rebuild

CXX = g++
CXXFLAGS = -std=c++17 -Iinclude -Wall 
# CXXFLAGS = -std=c++17 -Iinclude -Wall -lpng16 -I/usr/local/include -L/usr/local/lib -framework OpenGL -framework Foundation -framework GLUT

SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)
	
TARGET = $(BIN_DIR)/nes

run: clean $(TARGET) 
	./$(TARGET)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean: 
	rm -rf $(OBJ_DIR) $(BIN_DIR)/nes

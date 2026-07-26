# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra

# Directories
SRC_DIR = .
BUILD_DIR = $(SRC_DIR)/build
CHP_SIM_DIR = $(SRC_DIR)/chp_sim_cpp

# Source files
SRCS = $(SRC_DIR)/main.cpp \
       $(CHP_SIM_DIR)/chp_sim.cpp \
       $(CHP_SIM_DIR)/clifford_T.cpp

# Object files
OBJS = $(BUILD_DIR)/main.o \
       $(BUILD_DIR)/chp_sim.o \
       $(BUILD_DIR)/clifford_T.o

# Include directories
INCLUDES = -I$(CHP_SIM_DIR)

# Output executable
TARGET = $(BUILD_DIR)/simulator

# Rules
all: $(BUILD_DIR) $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET)

$(BUILD_DIR)/main.o: $(SRC_DIR)/main.cpp $(CHP_SIM_DIR)/clifford_T.h $(CHP_SIM_DIR)/chp_sim.h
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $(SRC_DIR)/main.cpp -o $@

$(BUILD_DIR)/chp_sim.o: $(CHP_SIM_DIR)/chp_sim.cpp $(CHP_SIM_DIR)/chp_sim.h
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $(CHP_SIM_DIR)/chp_sim.cpp -o $@

$(BUILD_DIR)/clifford_T.o: $(CHP_SIM_DIR)/clifford_T.cpp $(CHP_SIM_DIR)/clifford_T.h $(CHP_SIM_DIR)/chp_sim.h
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $(CHP_SIM_DIR)/clifford_T.cpp -o $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean

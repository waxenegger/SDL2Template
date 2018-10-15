PROJECT_ROOT = ./

SRC = $(PROJECT_ROOT)src/
SRCS = $(wildcard $(SRC)*.cpp)
OBJS = $(SRCS:%.cpp=%.o)
OUT = $(PROJECT_ROOT)out
BIN = $(OUT)/SDL2Template

CXXFLAGS += -std=c++11 -std=c++0x `sdl2-config --cflags`

all:	init sdltemplate	

init: 
	@echo -e "\nPreparing Output Directory ..."
	@mkdir -p $(OUT)
	@echo -e "Directory Created\n"

%.o:	%.cpp
	@echo -n "Compiling $@ ..."
	@$(CXX) -c $(CXXFLAGS) -o $@ $< 
	@echo -e " DONE\n"

sdltemplate:	$(OBJS)
	@echo "Linking Executable ..."
	@$(CXX) `sdl2-config --libs` $^ -o $(BIN)
	@echo "Linked Executable: $(BIN)"

clean:
	@echo "Cleaning ..."
	@rm -fr $(OUT) $(SRC)*.o
	@echo "Cleaning Finished"

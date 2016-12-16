#Folders that contains th source and exec files
SRC_DIR = ./src/
DEBUG_DIR = ./build/debug/
RELEASE_DIR=./build/release/
#OBJS specifies which files to compile as part of the project
OBJS = $(SRC_DIR)main.cpp
#CC specifies which compiler we're using
CC = g++
#SFML compiler and linker
SFMLCFLAGS = $(shell pkg-confg --cflags sfml-graphics)
SFMLLIBS = $(shell pkg-config --libs sfml-graphics)
#COMPILER_FLAGS specifies the additional compilation options we're using
# -w suppresses all warnings
COMPILER_FLAGS = -w $(SFMLCFLAGS)
#LINKER_FLAGS specifies the libraries we're linking against
LINKER_FLAGS = $(SFMLLIBS)
#OBJ_NAME specifies the name of our exectuable
OBJ_NAME = hello_SFML
DEBUG_OBJ_NAME = $(DEBUG_DIR)$(OBJ_NAME)
RELEASE_OBJ_NAME = $(RELEASE_DIR)$(OBJ_NAME)
#This is the target that compiles our executable
all : $(OBJS)
	$(CC) $(OBJS) $(COMPILER_FLAGS) $(LINKER_FLAGS) -o $(OBJ_NAME)
debug: $(OBJS)
	$(CC) $(OBJS) $(COMPILER_FLAGS) $(LINKER_FLAGS) -o $(DEBUG_OBJ_NAME)
release : $(OBJS)
	$(CC) $(OBJS) $(COMPILER_FLAGS) $(LINKER_FLAGS) -o $(RELEASE_OBJ_NAME)

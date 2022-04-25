DICT?=data/test-dic.txt

EXEC:=dict

SRC_DIR=src

SRC:=$(wildcard $(SRC_DIR)/*.c)
HDR:=$(wildcard $(SRC_DIR)/*.h)

FLAGS:=-Wall -Wpedantic
CC:=gcc

all: $(SRC) $(HRD)
	$(CC) $(SRC) $(HDR) -o $(EXEC) $(FLAGS)
	./$(EXEC) $(DICT)

clean:
	rm *~ $(EXEC) *.tmp

phony: clean

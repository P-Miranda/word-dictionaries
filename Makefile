DICT?=/usr/share/dict/words
DICT?=test-dic.txt

EXEC:=dict

SRC:=$(wildcard *.c)
HDR:=$(wildcard *.h)

FLAGS:=-Wall -Wpedantic
CC:=gcc

all: $(SRC) $(HRD)
	$(CC) $(SRC) $(HDR) -o $(EXEC) $(FLAGS)
	./$(EXEC) $(DICT)

clean:
	rm *~ $(EXEC) *.tmp

phony: clean

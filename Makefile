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

format:
	@./ci/format_run.sh

ci-format:
	@./ci/format_check.sh

phony: clean

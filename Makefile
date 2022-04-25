DICT?=data/test-dic.txt

EXEC:=dict

SRC_DIR=src

SRC:=$(wildcard $(SRC_DIR)/*.c)
HDR:=$(wildcard $(SRC_DIR)/*.h)

FLAGS:=-Wall -Wpedantic
CC:=gcc

all: $(EXEC)
	./$(EXEC) $(DICT)

$(EXEC): build

build: $(SRC) $(HRD)
	$(CC) $(SRC) $(HDR) -o $(EXEC) $(FLAGS)

format:
	@./ci/format_run.sh

ci-format:
	@./ci/format_check.sh

clean:
	rm -rf *~ $(EXEC) *.tmp

clean-all: clean
	rm -rf compile_commands.json
	rm -rf .ccache/*

phony: clean

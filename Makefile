#***************APPLICATION INFORMATION***************
TARGET = MyApplication 

#***************COMPILER AND TOOLS INFORMATION********
SDCC = sdcc
CFLAGS = -lstm8 -mstm8
LIBS = 
STM8FLASH = stm8flash

#***************DEVICE INFORMATION********************
DEVICE = stm8s103f3
PROGRAMMER = stlinkv2

#***************DIRECTORY INFORMATION*****************
SRCDIR = src
BIN = bin
INCLUDES = includes
DOCS = doc

#***************FILE SPECIFICATIONS*******************
SOURCES = $(wildcard src/*.c) 
NAMES = $(basename $(SOURCES))
NAMES := $(filter-out ${MAIN_SOURCE}, $(NAMES))
RELS = $(wildcard bin/*.rel)

#***************BUILD TARGETS*************************
all: build

build: $(TARGET:=.ihx)
	
$(TARGET:=.ihx): $(subst src/,,$(NAMES:=.rel))
	$(info ************ Creating Executable ************)
	$(SDCC) $(CFLAGS) --out-fmt-ihx ${RELS} -o $(BIN)/$(subst src/,,$@)

clean:
	$(info ************ Cleaning Build Artefacts ************)
	-rm -f $(BIN)/*.o $(BIN)/*.asm $(BIN)/*.cdb $(BIN)/*.lk $(BIN)/*.lst $(BIN)/*.map $(BIN)/*.rel $(BIN)/*.rst $(BIN)/*.sym $(BIN)/*.ihx

flash:
	$(info ************ Flashing Device ************)
	stm8flash -c ${PROGRAMMER} -p ${DEVICE} -w $(BIN)/$(TARGET:=.ihx)
	
%.rel: src/%.c
	$(SDCC) -I./${INCLUDES} -c $(CFLAGS) $< -o $(BIN)/$(subst src/,,$@)
	
#***************UNIT TEST TARGETS***************
test: 
	$(info ************ Executing Unit Tests ************)
	make -i -f build/MakefileCppUTest.mk 
	
test-clean:
	$(info ************ Cleaning Test Artefacts ************)
	-rm -r -f $(BIN)/src $(BIN)/tests 
	-rm -r lib/tests

#***************DOXYGEN TARGETS***************
docs:
	cd $(DOCS); doxygen Doxyfile

docs-clean:
	-rm -r -f $(DOCS)/output/*

#***************GENERAL TARGETS***************
dist-clean:
	$(info ************ Cleaning All Artefacts ************)
	-rm -f $(BIN)/*.o
	-rm -f $(BIN)/*.asm
	-rm -f $(BIN)/*.cdb
	-rm -f $(BIN)/*.lk
	-rm -f $(BIN)/*.lst
	-rm -f $(BIN)/*.map
	-rm -f $(BIN)/*.rel
	-rm -f $(BIN)/*.rst
	-rm -f $(BIN)/*.sym
	-rm -f $(BIN)/*.ihx
	-rm -r -f $(BIN)/src $(BIN)/tests 
	-rm -r lib/tests
	-rm -r -f $(DOCS)/output/* 

GCC_PREFIX  = $(RISCV)/bin/riscv32-unknown-elf
# ARCH_ABI    = -mabi=ilp32 -march=rv32i
ARCH_ABI    = -mabi=ilp32d -march=rv32imafdc
TEST_CFLAGS = -g -O3 -funroll-all-loops

BUILD_DIR = ../snapshots/fpga
TEST__DIR = ../testbench/tests/$(TEST)

LINK = $(TEST__DIR)/$(TEST).lds

# OBJ_FILES = $(TEST__DIR)/crt0.o $(TEST__DIR)/$(TEST).o $(TEST__DIR)/printf.o
# OBJ_FILEs was define in test.mki file
include $(TEST__DIR)/$(TEST).mki

program.hex: $(OBJ_FILES) $(LINK)
	@echo Building $(TEST)
	$(GCC_PREFIX)-gcc $(ARCH_ABI) -Wl,-Map=$(TEST).map -lgcc -T$(LINK) -o $(TEST).elf $(OBJ_FILES) -nostartfiles
	$(GCC_PREFIX)-objcopy -O verilog $(TEST).elf $(TEST).hex
	$(GCC_PREFIX)-objdump -S  $(TEST).elf > $(TEST).dis
	@echo Completed building $(TEST)

%.o : $(TEST__DIR)/%.s ${BUILD_DIR}/defines.h
	@echo "Compile Assembly: $<"
	$(GCC_PREFIX)-cpp -I${BUILD_DIR}  $<  > $*.cpp.s
	$(GCC_PREFIX)-as $(ARCH_ABI) $*.cpp.s -o $@

#$(GCC_PREFIX)-as $(ARCH_ABI) $< -o $@


#$(GCC_PREFIX)-cpp -I${BUILD_DIR}  $<  > $*.cpp.s
#$(GCC_PREFIX)-as $(ARCH_ABI) $*.cpp.s -o $@


%.o : $(TEST__DIR)/%.c ${BUILD_DIR}/defines.h
	@echo "Compile C: $<"
	$(GCC_PREFIX)-gcc -I${BUILD_DIR} ${TEST_CFLAGS} ${ARCH_ABI} -nostdlib -c $< -o $@

.PHONY: clean
clean:
	@rm *.cpp.s
	@rm *.o


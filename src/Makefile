all:
	@echo - Assembling boot.asm
	@nasm boot.asm -f bin -o boot.bin
	@echo - dd
	@dd if=boot.bin of=/dev/fd0
clean:
	@echo - Cleaning files
	@rm -f *.o *.bin *.img

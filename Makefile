GRUB_MKIMAGE = grub-mkimage
GRUB_MKIMAGE_FLAGS = --compress=xz --prefix=/AST --output=$@

#MODULES_BIOS       = $(shell find /usr/lib/grub/i386-pc/ -name *.mod | cut -d "/" -f 6 | cut -d "." -f 1 | xargs)
MODULES_I386-EFI   = $(shell find /usr/lib/grub/i386-efi/ -name *.mod | cut -d "/" -f 6 | cut -d "." -f 1 | xargs)
MODULES_X86_64-EFI = $(shell find /usr/lib/grub/x86_64-efi/ -name *.mod | cut -d "/" -f 6 | cut -d "." -f 1 | xargs)

all: astg2ldr.bios astg2ldr.i386.efi astg2ldr.x64.efi

astg2ldr.bios:
	${GRUB_MKIMAGE} ${GRUB_MKIMAGE_FLAGS} --format=i386-pc ${MODULES_BIOS}

astg2ldr.i386.efi:
	${GRUB_MKIMAGE} ${GRUB_MKIMAGE_FLAGS} --format=i386-efi ${MODULES_I386-EFI}

astg2ldr.x64.efi:
	${GRUB_MKIMAGE} ${GRUB_MKIMAGE_FLAGS} --format=x86_64-efi ${MODULES_X86_64-EFI}

clean:
	-rm -rf astg2ldr.{bios,i386.efi,x64.efi}


obj-m += sys_xcrypt.o

INC=/lib/modules/$(shell uname -r)/build/arch/x86/include

all: xhw1 xcrypt

xhw1: xhw1.c
	gcc -g -Wall -Werror -I$(INC)/generated/uapi -I$(INC)/uapi xhw1.c -o xhw1 -lcrypto 

xcrypt:
	make -Wall -Werror -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules


clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
	rm -f xhw1

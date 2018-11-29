#
# Makefile for the UM HW6
# 
CC = gcc

IFLAGS  = -I/comp/40/include -I/usr/sup/cii40/include/cii
CFLAGS  = -O2 -g -std=gnu99 -Wall -Wextra -Werror -pedantic  $(IFLAGS)
LDFLAGS = -g -L/comp/40/lib64 -L/usr/sup/cii40/lib64
LDLIBS  = -lcii40-O2 -lm

EXECS   = um

all: $(EXECS)

um: decode.o memory.o register.o instruction_driver.o um.o
	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS)


# To get *any* .o file, compile its .c file with the following rule.
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f  *.o


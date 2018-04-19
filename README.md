# Docker Nasm Toolchain

*disclaimer* gonna be honest I dont know what the word toolchain means so hit me with a PR if you got problem

## What?

A docker container with all (3 of) the tools for writing in the netwide assembler.

## Why?

Say you want to write some NASM code but you have a mac (or something else?), all you really need is three commands so a whole VM for this seems silly. Enter this thing, and *BOOM!* compile, link, execute, debug, everything you need!

## How?

### Get into the enviornment
say youre working somewhere and youve got your assembly code in a folder called `code`
```Bash
docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v `pwd`/code:/data -w /data -it robindiddams/nasm-toolchain /bin/bash
```

### Compiling nasm
lets say you have some 32 bit nasm program named `main.asm`

```Bash
# make our object file
nasm -f elf32 -o main.o main.asm
# now link it
ld -e _main -melf_i386 -o main main.o
# and run!
./main

# and if theres bugs, debug!
gdb main
```

### Do it all in one command

```Bash
docker run -v `pwd`:`pwd` -w `pwd` -it robindiddams/nasm-toolchain /bin/bash -c '/root/compileandlink.sh main.asm _main'
```
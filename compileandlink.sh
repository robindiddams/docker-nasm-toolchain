#!/bin/bash

infile=$1
base=${infile%.*}
if [ "$base" != "$infile" ]
then 
    nasm -f elf32 "$1" -o "$base.o"
    ld -e "$2" -melf_i386 -o "$base" "$base.o"
fi
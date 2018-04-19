FROM debian:latest

RUN apt-get update && apt-get install -y nasm gdb gcc

COPY setup_env.sh /root/.bashrc
COPY compileandlink.sh /root/
RUN ["chmod", "+x", "/root/compileandlink.sh"]
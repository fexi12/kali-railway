FROM kalilinux/kali-rolling

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    wget \
    nmap \
    nikto \
    sqlmap \
    dirb \
    gobuster \
    hydra \
    hashcat \
    john \
    aircrack-ng \
    netcat-traditional \
    recon-ng \
    theharvester \
    exploitdb \
    curl \
    git \
    net-tools \
    python3 \
    python3-pip \
    && apt-get clean

RUN wget -qO /bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 && \
    chmod +x /bin/ttyd

EXPOSE $PORT

CMD ["/bin/bash", "-c", "/bin/ttyd -p $PORT -c $USERNAME:$PASSWORD /bin/bash"]

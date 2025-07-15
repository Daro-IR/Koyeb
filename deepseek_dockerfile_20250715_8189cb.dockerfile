FROM ubuntu:22.04
RUN apt update && apt install -y wget build-essential
RUN wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.41-9782-beta/softether-vpnserver-v4.41-9782-beta-2023.03.14-linux-x64-64bit.tar.gz
RUN tar -xzf softether-vpnserver-*.tar.gz && cd vpnserver && make
EXPOSE 5555/tcp 1194/udp 4500/udp
CMD ["./vpnserver", "start"]

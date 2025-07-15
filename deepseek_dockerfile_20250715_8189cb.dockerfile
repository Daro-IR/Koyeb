FROM ubuntu:22.04
RUN apt update && apt install -y wget build-essential
RUN wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.44-9807-rtm/softether-vpnserver-v4.44-9807-rtm-2025.04.16-linux-arm_eabi-32bit.tar.gz
RUN tar -xzf softether-vpnserver-*.tar.gz && cd vpnserver && make
EXPOSE 443/tcp 5555/tcp 1194/udp 4500/udp
CMD ["./vpnserver", "start"]

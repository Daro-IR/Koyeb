# Usa una imagen base de Ubuntu
FROM ubuntu:22.04

# Instala dependencias
RUN apt update && apt install -y wget build-essential

# Descarga SoftEther VPN
RUN wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.41-9782-beta/softether-vpnserver-v4.41-9782-beta-2023.03.14-linux-x64-64bit.tar.gz

# Extrae y compila
RUN tar -xzf softether-vpnserver-*.tar.gz && \
    cd vpnserver && \
    make

# Expone los puertos clave
EXPOSE 5555/tcp 443/tcp 992/tcp 1194/udp 4500/udp

# Inicia SoftEther al arrancar
CMD ["./vpnserver", "start"]
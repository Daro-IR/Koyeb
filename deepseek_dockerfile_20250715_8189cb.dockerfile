FROM ubuntu:22.04

# Instalar dependencias y limpiar caché
RUN apt update && \
    apt install -y wget build-essential zlib1g-dev && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Descargar y extraer SoftEther (usa la última versión)
RUN wget  https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.44-9807-rtm/softether-vpnserver-v4.44-9807-rtm-2025.04.16-linux-arm64-64bit.tar.gz && \
    tar -xzf softether-vpnserver-*.tar.gz && \
    rm softether-vpnserver-*.tar.gz && \
    cd vpnserver && \
    make

# Exponer puertos
EXPOSE 443/tcp 5555/tcp 992/tcp 1194/udp 4500/udp

# Iniciar servicio
CMD ["./vpnserver", "start"]

# LocalProxyOpenVPN

LocalProxyOpenVPN is a Docker-based solution for setting up an OpenVPN client that redirects all traffic through the Docker server on which it is running. This project is based on the [ich777/openvpn-client](https://hub.docker.com/r/ich777/openvpn-client) image and includes a custom Dockerfile and `init.sh` script for initializing and configuring the client.

## Features

- Automatically redirects all network traffic to the Docker server where the container is running.
- Lightweight and minimal configuration.

## Prerequisites

- Docker installed on the server.
- An OpenVPN configuration file (`.ovpn`) for connecting to your VPN provider.

## Setup

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/LocalProxyOpenVPN.git
cd LocalProxyOpenVPN
```
### 2. Build the Docker Image

Build the Docker image using the provided Dockerfile:

```bash
docker build -t localproxy-openvpn .
```
### 3. Run the Container

Run the container with the OpenVPN client in the foreground:

```bash
docker run -it --cap-add=NET_ADMIN --sysctl net.ipv6.conf.all.disable_ipv6=1 --name OpenVPN-LocalClient -v /path/to/openvpn/conf:/vpn
```

### TEST
```bash
docker run -d \
  --name mongodb \
  -p 27017:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=mongo_user \
  -e MONGO_INITDB_ROOT_PASSWORD=mongo_password \
  mongo:latest
```
```bash
docker run -it --cap-add=NET_ADMIN --sysctl net.ipv6.conf.all.disable_ipv6=1 --name OpenVPN-LocalClient -v /path/to/openvpn/conf:/vpn
```
OpenVPN-LocalClient received the address 10.8.0.2. This means that MongoDB is located for 10.8.0.2:27017.  
## Caution! 
SSH is also pushed into the network. ssh root@10.8.0.2 it also becomes available
FROM ich777/openvpn-client
USER root
RUN apt-get update;
RUN apt-get install iptables sudo -y;
COPY init.sh /init.sh
RUN chmod 755 /init.sh
RUN chmod +x /init.sh
ENTRYPOINT [ "/init.sh" ]

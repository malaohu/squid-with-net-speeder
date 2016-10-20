# squid-net-speeder

FROM ubuntu:14.04.3
MAINTAINER malaohu <tua@live.cn>
RUN apt-get update && \
    apt-get install -y libnet1 libnet1-dev libpcap0.8 libpcap0.8-dev git squid
RUN wget http://7xnve2.com1.z0.glb.clouddn.com/squid.conf -O /etc/squid3/squid.conf
RUN git clone https://github.com/snooda/net-speeder.git net-speeder
WORKDIR net-speeder
RUN sh build.sh

RUN mv net_speeder /usr/local/bin/
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/net_speeder

# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

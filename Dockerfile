FROM ubuntu

COPY . /tmp/

RUN chmod +x /tmp/*.sh
RUN /bin/bash /tmp/install.sh

ENTRYPOINT /tmp/startup.sh

EXPOSE 80 81 443 8000 8443 8001 8444

STOPSIGNAL SIGTERM
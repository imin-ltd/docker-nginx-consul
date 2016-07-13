FROM nginx:latest

ENTRYPOINT ["/usr/local/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL consul:8500

ADD start.sh /usr/local/bin/start.sh
RUN rm -v /etc/nginx/conf.d/*.conf

ADD http://releases.hashicorp.com/consul-template/0.15.0/consul-template_0.15.0_linux_amd64.zip /var/tmp/
RUN apt-get -qq update && apt-get -qq install unzip
RUN unzip -d /usr/local/bin /var/tmp/consul-template_0.15.0_linux_amd64.zip

ADD service.ctmpl /templates/

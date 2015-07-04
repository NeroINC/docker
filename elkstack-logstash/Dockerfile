FROM logstash:1.5.2

VOLUME /etc/logstash/conf.d

# Set a default config and create shareable data directory
COPY conf.d/logstash.conf /etc/logstash/conf.d/logstash.conf
RUN mkdir -p /usr/share/logstash/data

VOLUME /etc/logstash/conf.d
VOLUME /usr/share/logstash/data

# Use custom entrypoint shell script
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

CMD ["logstash", "-f", "/etc/logstash/conf.d/logstash.conf"]

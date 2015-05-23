FROM logstash:1.5

VOLUME /etc/logstash/conf.d

COPY conf.d/logstash.conf /etc/logstash/conf.d/logstash.conf
COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["logstash"]
CMD ["logstash", "-f", "/etc/logstash/conf.d/logstash.conf"]

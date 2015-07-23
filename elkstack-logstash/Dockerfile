FROM logstash:1.5.3

# Install additional plugins
RUN /opt/logstash/bin/plugin install logstash-codec-cloudtrail
RUN /opt/logstash/bin/plugin install logstash-codec-cloudfront

# Use custom entrypoint shell script
COPY docker-entrypoint.sh /custom-entrypoint.sh
RUN chmod +x /custom-entrypoint.sh
ENTRYPOINT ["/custom-entrypoint.sh"]
CMD ["logstash"]
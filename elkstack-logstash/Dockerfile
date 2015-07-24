FROM logstash:1.5.3

# Install additional plugins
RUN /opt/logstash/bin/plugin install logstash-codec-cloudtrail
RUN /opt/logstash/bin/plugin install logstash-codec-cloudfront
RUN /opt/logstash/bin/plugin install logstash-input-cloudwatch

# Temporary workaround for https://github.com/logstash-plugins/logstash-input-http/commit/c20c01c73bdf38f657b8dfbd6262840fba7e1cf1
RUN sed -i '/require "puma\/minissl"/a require "base64"' /opt/logstash/vendor/bundle/jruby/1.9/gems/logstash-input-http-1.0.1/lib/logstash/inputs/http.rb

# Use custom entrypoint shell script
COPY docker-entrypoint.sh /custom-entrypoint.sh
RUN chmod +x /custom-entrypoint.sh
ENTRYPOINT ["/custom-entrypoint.sh"]
CMD ["logstash"]
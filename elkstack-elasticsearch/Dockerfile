FROM elasticsearch:1.6

# Install Elasticsearch Curator
RUN apt-get update -q \
  && apt-get install -qy python-pip \
  && apt-get clean \
  && pip install elasticsearch-curator

# Install additional plugins
RUN /usr/share/elasticsearch/bin/plugin -i lmenezes/elasticsearch-kopf
RUN /usr/share/elasticsearch/bin/plugin -i elasticsearch/elasticsearch-cloud-aws/2.5.1

# Use custom entrypoint shell script
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 9200 9300

FROM prom/alertmanager:v0.6.2

ENV "DEFAULT=logstash" \
    "ALERTMANAGER_BIN=/bin/alertmanager" \
    "SLACK_API=null" \
    "LOGSTASH_URL=http://logstash:8080/" \
    "HIPCHAT_ROOM=12345" \
    "HIPCHAT_TOKEN=abcdef" \
    "HIPCHAT_URL=http://hipchat/"

COPY rootfs /

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD        [ "-config.file=/etc/alertmanager/config.yml", \
             "-storage.path=/alertmanager" ]

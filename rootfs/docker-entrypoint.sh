#!/bin/sh -e

cat /etc/alertmanager/config.yml | \
    sed "s@#api_url: 'null'#@api_url: '$SLACK_API'@g" |\
    sed "s@#room_id: 'null'#@room_id: '$HIPCHAT_ROOM'@g" |\
    sed "s@#auth_token: 'null'#@auth_token: '$HIPCHAT_TOKEN'@g" |\
    sed "s@#hipchat_url: 'null'#@hipchat_url: '$HIPCHAT_URL'@g" |\
    sed "s@#logstash_url: 'null'#@url: '$LOGSTASH_URL'@g" > /tmp/config.yml

mv /tmp/config.yml /etc/alertmanager/config.yml

set -- $ALERTMANAGER_BIN "$@"

exec "$@"

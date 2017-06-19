# akailash/alertmanager

This is based on basi/alertmanager with hipchat receiver added in.

It has 3 different receivers configured: hipchat, logstash and slack.

## How to run it

You need to provide a valid slack api key and logstash endpoint and hipchat room id, token and url.
The only receiver to be used will be the one configured as $DEFAULT (hipchat, slack or logstash).
Both can be passed to the container as an environmental variable. For example:

    docker run \
      -e "DEFAULT=hipchat" \
      -e "HIPCHAT_ROOM=12345" \
      -e "HIPCHAT_TOKEN=XXXXXXXXX" \
      -e "HIPCHAT_URL=XXXXXXXXX" \
      -e "SLACK_API=https://hooks.slack.com/services/MY/API/KEY" \
      -e "LOGSTASH_URL=http://logstash:8080/" \
      akailash/alertmanager
      

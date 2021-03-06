#!/bin/bash
ES_HOST=${ES_PORT_9200_TCP_ADDR:-\"+window.location.hostname+\"}
ES_PORT=${ES_PORT_9200_TCP_PORT:-9200}
ES_SCHEME=${ES_SCHEME:-http}

cat << EOF > /usr/share/nginx/html/config.js
define(['settings'],
function (Settings) {
  return new Settings({
    elasticsearch: "http://localhost:9200",
    default_route     : '/dashboard/file/default.json',
    kibana_index: "kibana-int",
    panel_names: [
      'histogram',
      'map',
      'goal',
      'table',
      'filtering',
      'timepicker',
      'text',
      'hits',
      'column',
      'trends',
      'bettermap',
      'query',
      'terms',
      'stats',
      'sparklines'
    ]
  });
});
EOF

nginx -c /etc/nginx/nginx.conf

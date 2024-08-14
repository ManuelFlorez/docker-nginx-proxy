#!/bin/sh

# Sustituye las variables de entorno en el archivo de configuración
#envsubst '$MASTER_RATE $AUTH_RATE $REPORTS_RATE $BACKEND_MASTER $BACKEND_AUTH $BACKEND_REPORTS' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
envsubst '$MASTER_RATE $AUTH_RATE $REPORTS_RATE $BACKEND_MASTER $BACKEND_AUTH $BACKEND_REPORTS' < /usr/local/openresty/nginx/conf/nginx.conf.template > /usr/local/openresty/nginx/conf/nginx.conf

# Inicia Nginx en primer plano
#exec nginx -g 'daemon off;'

# Inicia OpenResty (Nginx)
exec openresty -g "daemon off;"
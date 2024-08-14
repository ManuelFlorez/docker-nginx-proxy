# Etapa 1: Construcción del archivo de configuración
FROM alpine:3.20.2 AS BUILDER

# Instala gettext para usar envsubst
RUN apk --no-cache add gettext

# Copia el archivo de configuración y el script de entrada al contenedor
COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY entrypoint.sh /entrypoint.sh

# Da permisos de ejecución al script
RUN chmod +x /entrypoint.sh

# Etapa 2: Configuración de la imagen final
#FROM nginx:1.27.0-alpine
FROM openresty/openresty:alpine

# Copia el archivo de configuración y el script de entrada desde la etapa de construcción
COPY --from=BUILDER /etc/nginx/nginx.conf.template /usr/local/openresty/nginx/conf/nginx.conf.template
COPY --from=BUILDER /entrypoint.sh /entrypoint.sh

# Expon el puerto 80 para el tráfico HTTP
EXPOSE 80

# Usa el script como punto de entrada
ENTRYPOINT ["/entrypoint.sh"]
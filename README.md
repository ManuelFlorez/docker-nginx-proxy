# nginx

## crear imagen

```bash
docker build -t my-nginx-image .
```

## ejecutar el contenedor

```bash
docker run -d --env-file .env -p 8080:80 my-nginx-image
```

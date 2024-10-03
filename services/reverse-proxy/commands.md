Start automated reverse proxy (no need to update conf files!)
```
docker run -d --name nginx-proxy --restart=always \
    -p 80:80 -p 443:443 \
    -v /var/run/docker.sock:/tmp/docker.sock:ro \
    nginxproxy/nginx-proxy:1.6
```
Consider deploying a container locally. As long as we specify `VIRTUAL_HOST` and `VIRTUAL_PORT` in the env var. This will be picked up by the reverse proxy. In the example below we are deploying an `nginx` container that will be accessed from `test.localhost`. (To use a domain other then localhost in the browser, you need to update the records in the domain provider)
```
docker run --detach \
    --name your-proxied-app \
    --env VIRTUAL_HOST=www.samirodrigue.com \
    --env VIRTUAL_PORT=80 \
    nginx
```
To achieve this with an external service we need to run the following command after updating the IP in the nginx.conf file in this repo. Consider using a No-IP agent (check source file) at the external service rather than using the IP directly. However at this point the `nginx-proxy` might not be sufficient. If you have a large number of external services, this process will be tedious and might benefit from using a more robust tool like traefik.
```
docker run --detach \
  --volume ./nginx.conf:/etc/nginx/conf.d/default.conf \
  --name external-service \
  --env VIRTUAL_HOST=external.localhost \
  --env VIRTUAL_PORT=80 \
  nginx
```
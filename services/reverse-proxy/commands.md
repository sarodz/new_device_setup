Start automated reverse proxy (no need to update conf files!)
```
docker run -d --name nginx-proxy --restart=always \
    -p 80:80 -p 443:443 \
    -v /var/run/docker.sock:/tmp/docker.sock:ro \
    nginxproxy/nginx-proxy:1.6
```
All containers deployed on the machine reverse proxy is deployed must include the `VIRTUAL_HOST` env var. You can have a subdomain specific routing. In the example below, I have set it to `test`. (To use a domain other then localhost, you need to update the records in the domain provider)
```
docker run --detach \
    --name your-proxied-app \
    --env VIRTUAL_HOST=test.localhost \
    nginx
```
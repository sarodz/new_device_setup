I have added a custom crontab file to overwrite the default behaviour. Now runs every 8 hours.
Originally the value was `2,7,12,17,22,27,32,37,42,47,52,57 * * * * /app/duck.sh 2>&1`

The following env variables are optional
* PUID
* PGID
* LOG_FILE

Source:
https://github.com/linuxserver/docker-duckdns
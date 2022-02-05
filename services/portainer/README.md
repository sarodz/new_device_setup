Added a new volume `conf` to the machine running this container to be able to provide custom configs/files to portainer.

Gotcha:
* Make sure the volume binded in any new service actually exists in the machine that the service will be deployed to. For example, if you are deploying to your edge machine make sure it exists there.
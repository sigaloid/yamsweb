# YamsWeb - A web UI for YAMS

[YAMS](https://yams.media) is a media server set up script that automatically handles services like qBitTorrent, *arr apps, and a media server like Jellyfin. By default it opens up on a laundry list of ports like so:

```
Service URLs:
qBittorrent: http://IP:8080/
Radarr: http://IP:7878/
Sonarr: http://IP:8989/
Lidarr: http://IP:8686/
Readarr: http://IP:8787/
Prowlarr: http://IP:9696/
Bazarr: http://IP:6767/
jellyfin: http://IP:8096/
Portainer: http://IP:9000/
```

Memorizing these URLs or even bookmarking them is boring! So I created a simple lightweight HTML web UI. It simply hosts links to these services. That's all!

![screenshot](image.png)

### Configuration

Configuration is easy - simply define a volume to hold the configs and expose the ports.

```bash
mkdir yamsweb
# Modify this list to your heart's content. The full list of available apps to add can be found in index.html
# You can change jellyfin to plex or emby and the icons still work
echo "qbittorrent,radarr,sonarr,lidarr,readarr,prowlarr,bazarr,jellyfin" | tee yamsweb/apps.txt
# 3000 is the internal port, 4242 is the external port.
docker run -d -p 4242:3000 --name yamsweb -v $(pwd)/yamsweb:/home/static/apps quay.io/sigaloid/yamsweb
# Open http://[IP]:4242/
```

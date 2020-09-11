# Set Up Nextcloud with NGINX Reverse Proxy

This is for private use.
Therefore we have to ask when we should use Docker and when we should keep the old style of installing our programs to the bare-metal server.

We have decided to directly install the NGINX reverse proxy on the server itself.
Every service itself will run in a Docker container.

## Port Forwarding

## LetsEncrypt SSL Certificates

[*Let's Encrypt*](https://letsencrypt.org/) is a free, automated, and open certificate authority (CA).
It is a service provided by the Internet Security Research Group (ISRG) to give people the digital certificates they need in order to enable HTTPS (SSL/TLS) for websites, for free.

[*Certbot*](https://certbot.eff.org/) is a free, open source software tool for automatically using *Let's Encrypt* certificates on manually-administrated websites.

To make sure we understand every step, we only generated the certificate and do the configurations by ourselves.

    sudo certbot certonly --standalone

If we already have a web server running and do not want to quit it, then we will use the following command.

    sudo certbot certonly --webroot

TODO: Automatic Renewal

## NGINX Reverse Proxy

    sudo pacman -S nginx
    sudo systemctl enable --now nginx

Substitute your hostname, such as `example.com`, with `<your_hostname>`.

```
server {
    listen 80;
    server_name <your_hostname>;
    return 301 https://<your_hostname>$request_uri;
}

server {
    listen 443 ssl;
    server_name <your_hostname>;

    ssl_certificate /etc/letsencrypt/live/<your_hostname>/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/<your_hostname>/privkey.pem;

    proxy_redirect off;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Host $server_name;

    location /nextcloud {
        proxy_pass http://localhost:8080;
        rewrite /nextcloud/(.*) /$1 break;
    }
}
```


- Think about maximal upload file size.
- Measure internal file upload vs external file upload. Make sure not to use internet connection internally.

## Nextcloud in Docker Container

`docker-compose.yml` file

```yaml
version: '2'

volumes:
  nextcloud:
  db:

services:
  db:
    image: mariadb
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW
    restart: always
    volumes:
      - db:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=nextcloud
      - MYSQL_PASSWORD=nextcloud
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud

  app:
    image: nextcloud:latest
    ports:
      - 8080:80
    links:
      - db
    depends_on:
      - db
    volumes:
      - nextcloud:/var/www/html
    environment:
      - APACHE_DISABLE_REWRITE_IP=1
      - TRUSTED_PROXIES=localhost
      - OVERWRITEWEBROOT=/nextcloud
    restart: always
```

## TURN Server for Nextcloud Talk

    sudo pacman -S install coturn
 
    sudo sed -i '/TURNSERVER_ENABLED/c\TURNSERVER_ENABLED=1' /etc/default/coturn
 
`/etc/turnserver.conf`
 
```
listening-port=3478
fingerprint
lt-cred-mech # Only on coTURN below v4.5.0.8!
use-auth-secret
static-auth-secret=<secretSecret>
realm=your.domain.org
total-quota=100
bps-capacity=0
stale-nonce
no-loopback-peers # Only on coTURN below v4.5.1.0!
no-multicast-peers
```

    systemctl restart coturn
 

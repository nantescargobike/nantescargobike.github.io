FROM kyma/docker-nginx
ADD public/ /var/www
ADD nginx-default /etc/nginx/sites-enabled/default
CMD 'nginx'

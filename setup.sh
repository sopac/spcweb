

SITE_NAME="Geoscience Division | Pacific Community"
MASTER_PASSWORD=erlang44
ADMIN_USER=admin
ADMIN_EMAIL=sachindras@spc.int
DEFAULT_INSTANCE=spcweb_wordpress_1

docker-compose up --build -d
echo Waiting for 30 seconds...
sleep 30

host_ip=$(ip addr show $HOST_NETWORK_DEVICE_NAME | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
port=$(docker port $DEFAULT_INSTANCE 80)
url="${port/0.0.0.0/$host_ip}"

#Installing Default Instance Site
docker exec $DEFAULT_INSTANCE wp --allow-root core install --url=http://localhost --title="$SITE_NAME" --admin_user=$ADMIN_USER --admin_password=$MASTER_PASSWORD --admin_email=$ADMIN_EMAIL

#Installing Themes
docker exec $DEFAULT_INSTANCE wp --allow-root theme install /spc/extra.zip --activate
docker exec $DEFAULT_INSTANCE wp --allow-root theme install /spc/divi.zip

#Installing Plugins
docker exec $DEFAULT_INSTANCE wp --allow-root plugin install /spc/divi-builder.zip --activate

PLUGINS=(breadcrumb download-manager events-manager search-filter wp-posts-carousel yuzo-related-post sitepress-multilingual-cms jetpack ultimate-posts-widget)
for p in ${PLUGINS[@]}; do
    docker exec $DEFAULT_INSTANCE wp --allow-root plugin install $p --activate
done

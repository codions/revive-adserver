#!/bin/bash

set -e

# Enable Supervisor GUI
if [ "$ENABLE_SUPERVISOR_GUI" = "true" ] ; then
    printf "${COL_GREEN} -----> Info:${COL_RESET} Starting Supervisor GUI service...\n"
    cp -f $SUPERVISOR_GUI_CONF.default $SUPERVISOR_GUI_CONF
else
    rm -f $SUPERVISOR_GUI_CONF
fi

# Enable PHP FPM
if [ "$ENABLE_PHPFPM" = "true" ] ; then
    printf "${COL_GREEN} -----> Info:${COL_RESET} Starting PHP FPM service...\n"
    cp -f $PHPFPM_CONF.default $PHPFPM_CONF
else
    rm -f $PHPFPM_CONF
fi


# Enable NGINX
if [ "$ENABLE_NGINX" = "true" ] ; then
    printf "${COL_GREEN} -----> Info:${COL_RESET} Starting NGINX service...\n"
    cp -f $NGINX_CONF.default $NGINX_CONF

    # Update nginx to match worker_processes to no. of cpu's
    procs=$(cat /proc/cpuinfo | grep processor | wc -l)
    sed -i -e "s/worker_processes  1/worker_processes $procs/" /etc/nginx/nginx.conf

    # Always chown webroot for better mounting
    chown -Rf nginx.nginx /usr/share/nginx/html

else
    rm -f $NGINX_CONF
fi

# Start supervisord and services
printf "${COL_GREEN} -----> Info:${COL_RESET} Launching supervisord...\n"
/usr/local/bin/supervisord -n -c /etc/supervisord.conf
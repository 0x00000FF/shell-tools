#!/bin/sh

if [ -z "${DOMAIN_NAME}" ]; then
    echo "domain name is not specified"
    exit
fi

if [ -z "${MAIL_ADDRESS}" ]; then
    echo "mail address is not specified"
    exit
fi

# prepare certbot-auth-hook.sh and certbot-cleanup-hook.sh by yourselves
certbot certonly --manual --no-eff-email --manual-auth-hook /certbot-auth-hook.sh --manual-cleanup-hook /certbot-cleanup-hook.sh --preferred-challenges dns -d *.${DOMAIN_NAME} -d ${DOMAIN_NAME} --agree-tos -m ${MAIL_ADDRESS} --force-renewal

#!/bin/bash

APIKEY=${PORKBUN_APIKEY}
APISEC=${PORKBUN_APISEC}

DOMAIN=${DOMAIN_NAME}

# keep in mind that auth-hook.sh exports RECORD_ID 
curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" \
     -d "{ \"secretapikey\": \"${APISEC}\", \"apikey\": \"${APIKEY}\"" \
     "https://porkbun.com/api/json/v3/dns/delete/${DOMAIN}/${RECORD_ID}"

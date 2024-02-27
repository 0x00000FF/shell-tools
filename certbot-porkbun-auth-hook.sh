#!/bin/bash

APIKEY=${PORKBUN_APIKEY}
APISEC=${PORKBUN_APISEC}

DOMAIN=${DOMAIN_NAME}

RECNAME="_acme-challenge"
RECTYPE="TXT"
RECDATA=${CERTBOT_VALIDATION}
RECTTL=600

RESULT_FILE="api-result.json"

curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" -o "${RESULT_FILE}" \
        -d "{ \"secretapikey\": \"${APISEC}\", \"apikey\": \"${APIKEY}\", \"name\": \"${RECNAME}\", \"type\": \"${RECTYPE}\", \"content\": \"${RECDATA}\", \"ttl\": \"${RECTTL}\" }" "https://porkbun.com/api/json/v3/dns/create/${DOMAIN}"

STATUS=$(cat ${RESULT_FILE} | jq ".status")
ID=$(cat ${RESULT_FILE} | jq ".id")

echo API Request ${STATUS}, ID ${ID}
export RECORD_ID=${ID}

echo Awaiting DNS Propagation...
sleep 30

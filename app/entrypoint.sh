#!/usr/bin/env bash

if [ $# -ne 2 ]
then
    echo "Usage: docker run -v /var/run/docker.sock:/var/run/docker.sock hochzehn/alexa-domain-writer NUMBER_OF_DOMAINS RESTMQ_URL"
else
    # Parameters
    number_of_domains=$1
    restmq_url=$2

    echo "Start parsing first $number_of_domains Domains of Alexa ranking..."
    domains=$(docker run hochzehn/alexa-ranking-parser "$number_of_domains")
    echo "DOMAINS: $domains"

    echo "$domains" | parallel --jobs $jobs curl -s -X POST -d "value={}" "$restmq_url"

    exit 0 #Success
fi

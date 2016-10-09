# alexa-domain-writer

    Reads Alexa top domains and writes them to restmq

## Usage

    docker run -v /var/run/docker.sock:/var/run/docker.sock hochzehn/alexa-domain-writer 10 http://restmq:8888/q/domains

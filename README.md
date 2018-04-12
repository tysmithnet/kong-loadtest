# kong-loadtest

### Description
This is a kong/nginx container that has a custom plugin installed to inject latency and/or errors into the request/response stream.
It can be run as both a forward and reverse proxy. Do not run this in production for obvious reasons. If you need to make changes
to the configuration, just change kong.conf to your liking and docker build it again.

### Plugin Usage
The loadtest plugin operates like any other plugin where you can add it to any service, api, route, globally etc.
It can randomly inject errors and/or latency into responses. The config schema is as follows:
    {
        error_chance: 3,
        error_delay: 5000,
        latency_chance: 10,
        latency_delay: 10000
    }

The above configuration would inject a 500 status code and 5 seconds of delay approximately 33% of the time. Additionally, it would delay
approximately 10% of requests by 10 seconds.

### Example Usage
    $ /bin/bash runscript.sh
    $ export lh="localhost:8001"
    $ curl -X POST $lh/services --data "name=ws" --data "protocol=http" --data "host=10.5.53.13" --data "port=80"
    $ curl -X POST $lh/services/ws/routes --data "protocols[]=http" --data "methods[]=GET"
    $ curl -X POST $lh/services/ws/plugins --data "name=loadtest" --data "config.error_chance=3" --data "config.error_delay=3000" --data "config.latency_chance=3" --data "config.latency_delay=10000"

This would pull the latest version of the image and start it. Then a service named "ws" would route http traffic on port 80 to 10.5.53.13. Additionally, it would
configure the loadtest plugin to inject an error with 3 seconds of additional lag 33% of the time. Also it would add 10 seconds of lag to 33% of responses.
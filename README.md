# Local Mock Server

!!! WARNING !!!!!!!!!!!!!!!!!!!!!!!!  
WIP - a lot of settings are hardcoded and the settings are not 100%  
!!! WARNING !!!!!!!!!!!!!!!!!!!!!!!!

## Technology
- **Prism**: for mock API response ([more](https://stoplight.io/open-source/prism))
- **Nginx**: for proxy for dynamic local domains ([more](https://hub.docker.com/_/nginx))
- **dnsmasq**: for local DNS Server and forward local domain to Prism ([more](https://thekelleys.org.uk/dnsmasq/doc.html))

## Usage
### Import schemas
All schemas for mocking must be placed in the openapi directory in *.yaml format.

For example *api.yaml*:
```yaml
openapi: 3.0.0
info:
  title: Mock API
  version: 1.0.0
servers:
  - url: http://myapi.com
paths:
  /example:
    get:
      summary: Get Example
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema:
                type: object
                properties:
                  message:
                    type: string
                    example: Hello, World!

```

### Start Local Mock Server

In root directory run command:
```shell
sudo ./start.sh
```
- sudo is needed, because we need set up local DNS server.   
- if you start docker compose directly, DNS cannot be set and custom domains will not by works.

### Stop Local Mock Server

In terminal cancel process, basically:
```shell
CONTROL + C
```
After the containers are stopped, the system's default DNS settings will be set.   
**Fill password for sudo is needed!**

## How is it works?
The sudo ./start.sh command sets up a local DNS server on the system for all requests, forwards requests for specific url addresses from schemas to nginx and then prism for API mocking.

Once the start command is terminated in any way, a DNS reset is triggered and the system defaults are set.

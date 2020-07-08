#!/bin/sh

curl --head --fail --silent --user-agent healthcheck http://localhost:5000/version > /dev/null

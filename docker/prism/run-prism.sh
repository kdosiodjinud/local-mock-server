#!/bin/sh
prism mock -h 0.0.0.0 $(find /app/openapi -name "*.yaml") --dynamic

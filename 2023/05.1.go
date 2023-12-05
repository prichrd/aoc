#!/bin/sh

cd ./go
go run . 05.1 < "${1:-/dev/stdin}"

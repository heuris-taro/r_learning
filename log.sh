#!/bin/sh
tail -f log/development.log | grep -vE "(^\s*$|asset)"

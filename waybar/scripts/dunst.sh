#!/bin/bash

COUNT=$(dunstctl count waiting)
ENABLED=" $COUNT"
DISABLED=" $COUNT"
if dunstctl is-paused | grep -q "false" ; then echo $ENABLED; else echo $DISABLED; fi

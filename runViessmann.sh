#!/bin/bash
echo "Staring fetching Viessmann API..." >> /proc/1/fd/1
cd /home/python/Viessmann2Influx && python3 v2i_run.py >> /dev/null
echo "...Fetched Viessmann API!" >> /proc/1/fd/1
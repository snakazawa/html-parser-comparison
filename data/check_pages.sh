#!/bin/bash

ls pages/ -l | awk '$5 < 1000 {print $5 " " $9}'

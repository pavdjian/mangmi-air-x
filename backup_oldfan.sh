#!/bin/sh
#
# Backs up old fan files (see README.md for more information).
# adb shell
# sh /data/local/tmp/backup_oldfan.sh

set -euo pipefail

# Creates a backup directory for the old fan control scripts
mkdir -p /data/local/tmp/fanbak

# Copies the old fan control scripts to /data/local/tmp/fanbak
cp /vendor/bin/setfan_auto.sh /data/local/tmp/fanbak/
cp /vendor/bin/setfan_off.sh /data/local/tmp/fanbak/
cp /vendor/bin/setfan_max.sh /data/local/tmp/fanbak/
cp /vendor/bin/setfan_cool.sh /data/local/tmp/fanbak/
cp /vendor/etc/init/init.gammaos_fan.rc /data/local/tmp/fanbak/
cp /vendor/etc/audio_policy_configuration.xml /data/local/tmp/fanbak/

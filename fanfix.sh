#!/bin/sh
#
# fix fan on GammaOSnext 1.2 for Mangmi Air X
# run this script as root via adb shell (see README.md for more information).
# adb shell
# su
# sh /data/local/tmp/fanfix.sh
# reboot

set -euo pipefail

# Mount /vendor as read-write
mount -o rw,remount /vendor

# Copy the new fan_fake_pwm binary to /vendor/bin and set executable permissions
cp /data/local/tmp/gammaos_fix_files/fan_fake_pwm /vendor/bin/fan_fake_pwm
chmod +x /vendor/bin/fan_fake_pwm

# Copy the new fan control scripts to /vendor/bin
cp /data/local/tmp/gammaos_fix_files/setfan_auto.sh /vendor/bin/setfan_auto.sh
cp /data/local/tmp/gammaos_fix_files/setfan_off.sh /vendor/bin/setfan_off.sh
cp /data/local/tmp/gammaos_fix_files/setfan_max.sh /vendor/bin/setfan_max.sh
cp /data/local/tmp/gammaos_fix_files/setfan_cool.sh /vendor/bin/setfan_cool.sh
cp /data/local/tmp/gammaos_fix_files/init.gammaos_fan.rc /vendor/etc/init/init.gammaos_fan.rc
cp /data/local/tmp/gammaos_fix_files/audio_policy_configuration.xml /vendor/etc/audio_policy_configuration.xml


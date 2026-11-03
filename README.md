# Fan Fix for GammaOS Next 1.2 (Mangmi Air X)

This fix is aimed at the fan's `Auto` mode in GammaOS Next on Mangmi Air X devices.
In GammaOS Next 1.2, `Auto` mode does not seem to turn on the fan, at least
for MQ66 devices, in response to device temperature.

Additionally, the fan control scripts bundled here:
* remove the old startup pulse-delay behavior
* have distinct speed differences between `Cool` and `Max` modes

Once the installation is complete the fan should now startup as needed based on
device temperature when set to `Auto` mode. If you manually select `Cool` or `Max`
modes there should be no false starts, pulsing or starting/stopping until the fan
ramps up to the designated RPM. Additionally, `Cool` and `Max` modes should have
different fan speeds.

The `gammaos_fix_files` directory in this repo also contain an `audio_policy_configuration.xml`
file which apparently fixes issues with the headphone jack not working after installing.
GammaOS Next. While I can confirm the headphone jack works on my device,
I am unable to confirm if I had an issue previously as I do not normally use
wired headphones. The file is included, and the scripts do backup and replace the
original vendor file, so if users are having issues, these may help. On my device
at least, the original backed up system file and fix file are the same.

Please note, the `setfan_*.sh` scripts bundled here are not my work. If I make
changes I'll house updated scripts in a separate, clearly marked directory. The
initial commit of this code is done using scripts found on the Mangmi discord,
original author(s) unknown. I am happy to update and credit accordingly if
someone knows the author(s).

Below are the install steps I followed:
1. Install ADB on macOS
2. Back up your current fan-related files from the device
3. Apply the fanfix files to `/vendor`

## 1. Install ADB on macOS
```bash
brew install --cask android-platform-tools
```

Verify ADB and device detection (USB debugging must be enabled):
```bash
adb version
adb devices
```

## 2. Push Scripts and Backup Current Files
Push everything to `/data/local/tmp` (writable without root):
```bash
adb push backup_oldfan.sh /data/local/tmp/
adb push fanfix.sh /data/local/tmp/
adb push gammaos_fix_files /data/local/tmp/
```

Open a shell and run the backup script:
```bash
adb shell
sh /data/local/tmp/backup_oldfan.sh

# Confirm the script worked
ls -lah /data/local/tmp/fanbak
```

Optional: pull the backup to your Mac for safekeeping:
```bash
adb pull /data/local/tmp/fanbak <local_backup_path>
```

## 3. Apply Fan Fix (Root Required)
Make sure rooted ADB/debugging is enabled on the device:
Settings -> System Settings -> System -> Developer Options -> Rooted Debugging

Then run:
```bash
adb shell
su
sh /data/local/tmp/fanfix.sh

# Confirm exit code 0 to show success
echo $?

# Reboot device for changes to take effect
reboot
```

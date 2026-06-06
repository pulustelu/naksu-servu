Notes for myself
```sh
# adjust brightness
echo [0-100] | sudo tee /sys/class/backlight/acpi_video0/brightness
# check temps
lm_sensors
# overall system load
vmstat
```
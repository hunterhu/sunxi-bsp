setenv bootargs console=ttyS0,115200 console=tty0 hdmi.audio=EDID:0 disp.screen0_output_mode=EDID:480x272p60 root=/dev/mmcblk0p2 rootwait panic=10 ${extra}
fatload mmc 0 0x43000000 script.bin
fatload mmc 0 0x48000000 uImage
bootm 0x48000000

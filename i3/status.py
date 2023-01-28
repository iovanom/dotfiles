from i3pystatus import Status

status = Status(interval=2)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%a %-d %b %X KW%V",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
#status.register("load")


# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via D-Bus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# If you don't have a desktop notification demon yet, take a look at dunst:
#   http://www.knopwob.org/dunst/
status.register("battery",
    #format="{status}/{consumption:.2f}W {percentage:.2f}% [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}",
    format="{status} {percentage:.2f}% {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=10,
    status={
        "DIS": "",
        "CHR": "",
        "FULL": "",
    },)

# This would look like this:
# Discharging 6h:51m
#status.register("battery",
#    format="{status} {remaining:%E%hh:%Mm}",
#    alert=True,
#    alert_percentage=5,
#    status={
#        "DIS":  "Discharging",
#        "CHR":  "Charging",
#        "FULL": "Bat full",
#    },)

# Displays whether a DHCP client is running
'''
status.register("runwatch",
    name="DHCP",
    path="/var/run/dhclient*.pid",)
'''

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
status.register("network",
    interface="enp3s0",
    format_up="{v4cidr}",)

# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
    interface="wlp5s0",
    format_up="{essid} {quality:03.0f}%",)

status.register("openvpn",
                vpn_name="retently",
                status_command="bash -c 'systemctl show openvpn-client@%(vpn_name)s | grep ActiveState=active'",
                vpn_up_command="systemctl start openvpn-client@%(vpn_name)s",
                vpn_down_command="systemctl stop openvpn-client@%(vpn_name)s"
               )

status.register("ping", format=" {ping}ms")

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/",
    format=" {avail}/{total}G",)

"""
status.register("disk",
    path="/run/media/ivan/baracuda/",
    format=" disk {avail}/{total}G",)
"""

#status.register("mem_bar")
status.register("mem", format=" {total_mem} / {used_mem} G",
                divisor=1024**3)

status.register("cpu_usage_graph")
# Shows your CPU temperature, if you have a Intel CPU
status.register("temp", format=" {temp:.0f}°C",)


# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
    format="♪{volume}",)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
#status.register("mpd",
#    format="{title}{status}{album}",
#    status={
#        "pause": "▷",
#        "play": "▶",
#        "stop": "◾",
#    },)


status.register("spotify",
                format="{status}    ",
                status={"pause": "", "play": "", "stop": ""},
                format_no_player="  "
               )

#status.register("shell", command="i3-gnome-pomodoro status")
status.register('pomodoro',
                pomodoro_duration=20*60,
                break_duration=10*60,
                long_break_duration=30*60,
                sound="/home/ivan/Music/analog-watch-alarm_daniel-simion.wav",
                format=" {current_pomodoro}/{total_pomodoro} {time}")

status.run()

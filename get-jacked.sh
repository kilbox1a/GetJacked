#!/bin/bash

# load our jack session manager
#claudia &
#sleep 8

# clear any existing jack-pulse links
pacmd unload-module module-jack-sink
pacmd unload-module module-jack-source

# configure pulse connectors
pacmd load-module module-jack-source channels=2 source_name=rhythmbox-in client_name=rhythmbox-in connect=false
pacmd load-module module-jack-sink channels=2 sink_name=rhythmbox-out client_name=rhythmbox-out connect=false

pacmd load-module module-jack-source channels=2 source_name=firefox-in client_name=firefox-in connect=false
pacmd load-module module-jack-sink channels=2 sink_name=firefox-out client_name=firefox-out connect=false

pacmd load-module module-jack-source channels=2 source_name=spotify-in client_name=spotify-in connect=false
pacmd load-module module-jack-sink channels=2 sink_name=spotify-out client_name=spotify-out connect=false

# launch pulse applications
PULSE_SINK=rhythmbox-out rhythmbox  &
PULSE_SINK=firefox-out firefox &

# launch jack applications
#~/bin/REAPER/reaper

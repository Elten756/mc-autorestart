#!/bin/bash

# Screen name of the Minecraft server
SCREEN_NAME="mc"

# Send a message to Minecraft players
send_message() {
    local message=$1
    screen -S "$SCREEN_NAME" -p 0 -X stuff "say $message$(printf '\r')"
}

# Stop the server
stop_server() {
    send_message "The server is now restarting. Please be patient."
    sleep 5
    screen -S "$SCREEN_NAME" -p 0 -X stuff "stop$(printf '\r')"
}

# Schedule notifications
send_message "The server will restart in 1 hour."
sleep 2700 # Wait for 45 minutes

send_message "The server will restart in 15 minutes."
sleep 600 # Wait for 10 minutes

send_message "The server will restart in 5 minutes."
sleep 240 # Wait for 4 minutes

send_message "The server will restart in 1 minute."
sleep 60 # Wait for 1 minute

# Restart the server
stop_server

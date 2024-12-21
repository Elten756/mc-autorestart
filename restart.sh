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

# Scheduled notifications
send_message "The server will restart in 1 hour."
sleep 3600 # Wait for 1 hour

send_message "The server will restart in 30 minutes."
sleep 1800 # Wait for 30 minutes

send_message "The server will restart in 15 minutes."
sleep 900 # Wait for 15 minutes

send_message "The server will restart in 5 minutes."
sleep 300 # Wait for 5 minutes

send_message "The server will restart in 1 minute."
sleep 60 # Wait for 1 minute

# Restart the server
stop_server

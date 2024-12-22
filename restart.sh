#!/bin/bash

# Screen name of the Minecraft server
SCREEN_NAME="mc"

# Send a chat message to Minecraft players
send_message() {
    local message=$1
    screen -S "$SCREEN_NAME" -p 0 -X stuff "say $message$(printf '\r')"
}

# Send a title message to all players
send_title() {
    local title=$1
    screen -S "$SCREEN_NAME" -p 0 -X stuff "title @a title {\"text\":\"$title\",\"color\":\"red\",\"bold\":true}$(printf '\r')"
    screen -S "$SCREEN_NAME" -p 0 -X stuff "title @a subtitle {\"text\":\"Get ready for a restart!\",\"color\":\"white\"}$(printf '\r')"
}

# Play a sound for all players
play_sound() {
    local sound=$1
    screen -S "$SCREEN_NAME" -p 0 -X stuff "playsound $sound master @a ~0 ~0 ~0 100 1$(printf '\r')"
}

# Stop the server
stop_server() {
    send_message "The server is now restarting. Please be patient."
    send_title "Server Restarting!"
    play_sound "minecraft:block.note_block.bell"
    sleep 5
    screen -S "$SCREEN_NAME" -p 0 -X stuff "stop$(printf '\r')"
}

# Schedule notifications
send_message "The server will restart in 1 hour."
send_title "Restart in 1 Hour"
play_sound "minecraft:block.note_block.bell"
sleep 1800 # Wait for 30 minutes

send_message "The server will restart in 30 minutes."
send_title "Restart in 30 Minutes"
play_sound "minecraft:block.note_block.bell"
sleep 900 # Wait for 15 minutes

send_message "The server will restart in 15 minutes."
send_title "Restart in 15 Minutes"
play_sound "minecraft:block.note_block.bell"
sleep 600 # Wait for 10 minutes

send_message "The server will restart in 5 minutes."
send_title "Restart in 5 Minutes"
play_sound "minecraft:block.note_block.bell"
sleep 240 # Wait for 4 minutes

send_message "The server will restart in 1 minute."
send_title "Restart in 1 Minute"
play_sound "minecraft:block.note_block.bell"
sleep 60 # Wait for 1 minute

# Restart the server
stop_server

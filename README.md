# Minecraft Server Restart Script

This Bash script automates the process of sending scheduled notifications to players and restarting a Minecraft server. It uses `screen` to interact with the server console and ensures players are informed about the restart in advance.

## Features

- Sends countdown messages to players at predefined intervals (1 hour, 30 minutes, 15 minutes, 5 minutes, and 1 minute before the restart).
- Gracefully stops the server after notifying players.
- Customizable message system for easy adjustments.
- Supports scheduling with `crontab` for automated restarts.

## Prerequisites

- A Minecraft server running in a `screen` session.
- The `screen` command installed on your system.

## Setup

1. Ensure your Minecraft server is running in a `screen` session.  
   Example:  
   ```bash
   screen -S mc java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
   ```
2. Download or copy this script to your server environment.
3. Make the script executable:  
   ```bash
   chmod +x restart.sh
   ```
4. Edit the `SCREEN_NAME` variable in the script to match the name of your server's screen session (default is `mc`).

## Usage

Run the script manually or schedule it using `crontab` for automatic execution.

### Manual Execution

To run the script manually:  
```bash
./restart.sh
```

### Scheduling with `crontab`

1. Open your crontab file for editing:  
   ```bash
   crontab -e
   ```
2. Add the following line to schedule the script. For example, to restart the server daily at 3:00 AM:  
   ```bash
   0 3 * * * /path/to/restart.sh
   ```
   Replace `/path/to/restart.sh` with the full path to your script.

3. Save and exit the editor. Your server will now automatically restart at the specified time.

## Customization

- Modify the `send_message` function to change the notification messages.
- Adjust the `sleep` intervals if needed to fit your server's requirements.

## Example Output

Players will see messages like:
```
[Server] The server will restart in 1 hour.
[Server] The server will restart in 30 minutes.
[Server] The server will restart in 15 minutes.
[Server] The server will restart in 5 minutes.
[Server] The server will restart in 1 minute.
[Server] The server is now restarting. Please be patient.
```

## License

This script is provided under the [MIT License](LICENSE). Feel free to use, modify, and distribute it.

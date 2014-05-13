# autostrimmer


There are a fair few solutions for the Raspberry Pi that allow the system to automatically start up [Livestreamer](http://livestreamer.readthedocs.org/en/latest/). However, there's a few critical flaws:

* If the stream goes down for any reason, the Pi must be manually restarted (although this is solvable)
* The stream cannot be easily changed without changing config files and either restarting the Pi or running the process in a screen (introducing the first problem)

Autostrimmer is a set of scripts and files for init.d and /etc/defaults that automates this process, allowing quick and easy changing of the currently active stream to something else (useful if you're watching multi-game tournaments, or you just want to hop between streams). Right now this is a quick SSH command away, but in the future I will add a web UI for those who want it.

# Install

Autostrimmer depends on the following:
* omxplayer (included with raspbian)
* Livestreamer (installable with `apt-get install python-pip; pip install livestreamer` on Raspbian)
* An init-based distribution - autostrimmer is tested on Raspbian, if you're using Pidora or ALARM you'll need to use systemd's legacy init support (support for systemd will be added later)

Right now you'll need to manually move files to their correct places, but a proper installation script will be added at a later date. To install,
1. Move files in `init.d` & `default` to their respective directories in `/etc/`.
2. Move `.livestreamerrc` to your home `~` directory.
3. Move `changestream.sh` to `/usr/bin` or anywhere you want to execute it.

# Usage

First off, set your stream quality and first stream URL in `/etc/default/autostrim`. Once you've done this, do `/etc/init.d/autostrim start` or `service autostrim start` (preference) and your stream should bounce to life on the HDMI output of your Pi. (To set autostrim to start at boot, do `update-rc.d autostrim defaults`)

To change the stream URL, either edit `/etc/default/autostrim` and restart the service, or use the handy dandy included script to do it for you. Usage is as follows:
```
changestream.sh [streamurl]
```
OR
```
changestream.sh
```
starts interactive mode.

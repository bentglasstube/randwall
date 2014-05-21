# RandWall

Random wallpapers and a matching login screen

This is a collection of things that will give you some randomly picked
wallpapers to use for X11 and with SLiM (and slimlock).  It uses systemd and is
generally geared toward arch linux but I suppose you could use it elsewhere if
you want.

## Prerequisites

 - bash
 - feh
 - find
 - imagemagick
 - shuf (coreutils)
 - pgregp

## Wallpaper picking script

This script (`/usr/bin/randwall`) will read a configuration file from
`/etc/randwall.conf` and choose a random wallpaper to use.  It will resize and
crop the image to the configured resolution and save it in `/tmp/`.

## Wallpaper fetching script

This script (`/usr/bin/getwalls`) will look on reddit for wallpapers.  It uses
the same configuration script as above.

## Installation

Running `make install` should get everything put in place.  After that you will
want to enable the service with `systemctl enable randwall`.  You will also
probably want to add something to your `.xinitrc` to set the wallpaper when your
X session starts.  I use the following: `feh --bg-fill /tmp/wallpaper &`.  You
will also probably want to edit your SLiM config to use the `randwall` theme.

### Notice

SLiM will not run if you set this theme and there is no wallpaper found at
`/tmp/wallpaper`.  You can change the scripts and the theme symlink to point
elsewhere if you are worried about it.  It should work if the `randwall` service
is enabled, but it can fail if, for example, your wallpapers are stored in an
encrypted volume.

## Customization

You can customize the SLiM theme panel.  There is an SVG file of it in the
`theme` directory.  The makefile will use inkscape to make it into the png that
SLiM wants.

If you want to customize the install directories or whatever, you are on your
own.  I wish you luck.

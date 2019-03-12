#!/usr/bin/env python
from subprocess import PIPE, Popen
import os

def get_metadata(key):
    """
    Get the track metadata of the given key (valid playerctl parameter).
    """
    command = ['playerctl', 'metadata', key]
    with open(os.devnull, 'w') as devnull:
        metadata = Popen(command, stdout=PIPE, stderr=devnull).stdout.read()
    metadata = metadata.decode().strip()

    return metadata


def print_track_info():
    """
    Print [artist] - [track title] if successfully retrieved.
    Otherwise clear the bar message by printing an empty string.
    """
    artist, title = map(get_metadata, ("artist", "title"))
    track_info = ""

    if artist and title:
        track_info = "{} - {}".format(artist, title)

    print(track_info)


if __name__ == '__main__':
    try:
        print_track_info()
    except Exception as e:
        print("ERR! Please debug the script.\n{}".format(e))


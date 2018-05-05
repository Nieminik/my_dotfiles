from subprocess import PIPE, Popen
import os

def get_metadata(key):
    command = ['playerctl', 'metadata', key]
    with open(os.devnull, 'w') as devnull:
        return Popen(command, stdout=PIPE, stderr=devnull).stdout.read()

if __name__ == '__main__':
    for metadata in 'artist', 'title':
        locals()[metadata] = get_metadata(metadata).decode()
    print('{} - {}'.format(artist, title) if all((artist, title)) else '')


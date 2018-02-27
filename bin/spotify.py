from subprocess import PIPE, Popen
import os

def get_metadata(key):
    with open(os.devnull, 'w') as devnull:
        return Popen(['playerctl', 'metadata', key], stdout=PIPE, stderr=devnull).stdout.read()

if __name__ == '__main__':
    artist = get_metadata('artist').decode()
    title = get_metadata('title').decode()
    if all((artist, title)):
        print('%s - %s' % (artist, title))
    else:
        print('')



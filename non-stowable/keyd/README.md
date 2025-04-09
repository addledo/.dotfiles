Requires package: keyd

default.conf file goes in /etc/keyd/default.conf

Activate (once):
    sudo systemctl enable keyd

On modify:
    sudo keyd reload


sudo keyd monitor: print key events, useful to debug what is remapped
keyd list-keys: list all the valid key names, useful to check the possibilities
backspace+escape+enter keyboard combo: terminate keyd anywhere anytime in case you severely messed up

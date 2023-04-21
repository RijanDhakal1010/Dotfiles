#!/bin/bash
rsync -avz --delete --exclude={".git","rsync.sh"} . ~/.config/nvim

# wsl bash

## remove background color for directories when listing

```sh
dircolors -p | sed 's/;42/;01/' > ~/.dircolors
source ~/.bashrc
```

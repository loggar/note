# Remove an app: i.e. Chess

## Complete Chess Removal Steps:

```sh
$ ls /Applications/ | grep -i chess
Chess.app

$ sudo rm -rf /Applications/Chess.app
$ rm -rf ~/Library/Application\ Support/dev.chess.Chess-Stable
$ rm -rf ~/Library/Preferences/dev.chess.Chess-Stable.plist
$ rm -rf ~/Library/Caches/dev.chess.Chess-Stable
$ rm -rf ~/Library/Logs/Chess
$ rm -rf ~/.chess
$ ls /Applications/ | grep -i chess
```

1. **Removed the main application**: `/Applications/Chess.app`
2. **Cleaned up application support files**: `~/Library/Application Support/dev.chess.Chess-Stable`
3. **Removed preferences**: `~/Library/Preferences/dev.chess.Chess-Stable.plist`
4. **Cleared cache files**: `~/Library/Caches/dev.chess.Chess-Stable`
5. **Removed log files**: `~/Library/Logs/Chess`
6. **Cleaned up configuration**: `~/.chess`

The final verification shows that Chess is no longer in the Applications folder (the command returned exit code 1, meaning no results found).

**Optional cleanup**: If you want to be extra thorough, you can also empty your Trash and restart your Mac, but this isn't necessary for the uninstallation to be complete.

Chess terminal has been completely removed from your system!

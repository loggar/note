# vi editor

## Concept

| vi                                                                                                                         | GUI Text Editor                                                                             |
| -------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| Command                                                                                                                    | Shortcut key                                                                                |
| Commands are case sensitive                                                                                                | Shortcut keys are not case sensitive                                                        |
| Buffer                                                                                                                     | Document                                                                                    |
| Starts in Command mode                                                                                                     | Starts in Insert mode                                                                       |
| Press i, a, I, A to enter into Insert mode.                                                                                |
| You have to press one of these keys before text gets added to the document.                                                | Always in Insert mode, so you just keep typing to add text.                                 |
| Press ESC key to return to Command mode.                                                                                   |
| When in Insert mode, you have to press the ESC key before executing a command.                                             | Always in Insert mode. No mode switching is required. Shortcuts are active and can be used. |
| Commands do not work in Insert mode.                                                                                       | Shortcuts are active in Insert mode.                                                        |
| For copy/cut/paste, you can use the local clipboard or the system clipboard.                                               | Copy/cut/paste always uses the system clipboard                                             |
| Mouse and scroll wheel may not work to move the cursor. Have to use one of the many keyboard commands for cursor movement. | Mouse and scroll wheel works as expected.                                                   |

## Basic Operations

| vi Command             | Shortcut key                                                                              | Detail                                                                                                |
| ---------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| ESC                    | Return to command mode                                                                    |
| File operations        |
| :q                     | ALT F4                                                                                    | quit/close the application                                                                            |
| :q!                    | ALT F4, ‘No’ to save                                                                    | quit/close without saving                                                                             |
| :e                     | CTRL o                                                                                    | edit/open a file                                                                                      |
| :w                     | CTRL s                                                                                    | write/save to file                                                                                    |
| :bn                    | CTRL TAB                                                                                  | cycle forward through open buffers/documents                                                          |
| :bp                    | CTRL SHIFT TAB                                                                            | cycle reverse through open buffers/documents                                                          |
| :bd                    | CTRL F4                                                                                   | Close current buffer/document                                                                         |
| :buffers               | Window menu bar item                                                                      | Show all buffers/documents                                                                            |
| Cursor Movements       |
| h                      | Left Arrow                                                                                |
| j                      | Down Arrow                                                                                |
| k                      | Up Arrow                                                                                  |
| l                      | Right Arrow                                                                               |
| w                      | CTRL Right Arrow                                                                          | Move forward by a word                                                                                |
| b                      | CTRL Left Arrow                                                                           | Move backward by a word                                                                               |
| CTRL f                 | Page Down                                                                                 |
| CTRL b                 | Page Up                                                                                   |
| gg                     | CTRL Home                                                                                 | Beginning of document                                                                                 |
| G                      | CTRL End                                                                                  | End of document                                                                                       |
| :n                     | CTRL g (in some editors)                                                                  | Go to line number n                                                                                   |
| Enter into Insert mode |
| i                      | Insert before the cursor                                                                  |
| a                      | Insert after the cursor                                                                   |
| I                      | Home                                                                                      | Insert at the beginning of the line                                                                   |
| A                      | End                                                                                       | Insert at the end of line                                                                             |
| R                      | Insert                                                                                    | Insert and overwrite text as you type                                                                 |
| Deletion               |
| x                      | Delete                                                                                    |
| X                      | Backspace                                                                                 |
| Undo/Redo              |
| u                      | CTRL z                                                                                    | Undo                                                                                                  |
| CTRL r                 | CTRL y                                                                                    | Redo                                                                                                  |
| Find                   |
| /                      | CTRL f                                                                                    |
| *                      | Word on the cursor is set as the find string                                              |
| n                      | F3 (in some editors)                                                                      | Find Next                                                                                             |
| N                      | SHIFT F3 (in some editors)                                                                | Find Previous                                                                                         |
| :noh                   | clear last search highlights                                                              |
| Find and Replace       |
| :%s/Foo/Bar/gc         | CTRL h (in some editors)                                                                  | Foo is the search string and Bar is the replace string. The /gc asks for confirmation before replace. |
| Copy Cut Paste         |
| v                      | SHIFT Arrow keys                                                                          | Enter visual mode and start marking by using cursor movement keys h, j, k, l                          |
| V                      | Enter visual mode and start marking full lines by using up/down cursor movement keys j, k |
| ggVG                   | CTRL a                                                                                    | mark/select full buffer/document                                                                      |
| y                      | CTRL c                                                                                    | yank/copy                                                                                             |
| d                      | CTRL x                                                                                    | delete/cut                                                                                            |
| p                      | CTRL v                                                                                    | Lowercase p, paste after the current cursor position                                                  |
| P                      | Uppercase P, paste before the current cursor position                                     |
| "+y                    | CTRL c                                                                                    | copy to system clipboard                                                                              |
| "+d                    | CTRL x                                                                                    | cut to system clipboard                                                                               |
| "+p                    | CTRL v                                                                                    | Lowercase p, paste after the current cursor position from system clipboard                            |
| "+P                    | Uppercase P, paste before the current cursor position from system clipboard               |
| File Status            |
| CTRL g or :f           | Prints the current file information at the bottom status line                             |

## Useful Settings

|                 |                                                                                 |
| --------------- | ------------------------------------------------------------------------------- |
| :set autochdir  | Opening a file, the base directory is set to the location of the current buffer |
| :set hlsearch   | Highlight the text found during search                                          |
| :set ignorecase | Ignore Case during find                                                         |
| :set incsearch  | Incremental search, find as you type                                            |
| :set list       | Display hidden character like tab and end of line                               |
| :set number     | Show line numbers                                                               |
| :set ruler      | Display the current cursor position (row and column) at the bottom              |
| :set tabstop=4  | Tab shifts by 4 characters                                                      |
| :set expandtab  | Insert spaces instead of tab character                                          |


## More Operations

|     |                                                      |
| --- | ---------------------------------------------------- |
| .   | Repeat previous command                              |
| $   | Move to end of current line                          |
| 0   | Move to start of current line                        |
| o   | Open a new line below and insert mode                |
| O   | Open a new line above and insert mode                |
| r   | Overwrite one character under the cursor             |
| yy  | Copy the line where the cursor is                    |
| yw  | Copy a word                                          |
| dd  | Delete the line where the cursor is                  |
| dw  | Delete a word                                        |
| cw  | Change a word                                        |
| D   | Delete characters under the cursor until end of line |
| J   | Join/Combine two lines                               |

## Tips and Tricks

1. Startup configuration file

The `vimrc` file contains optional runtime configuration settings to initialize Vim when it starts. On Unix based systems, the file is named `.vimrc`, while on Windows systems it is named `_vimrc`. It's convenient to have some of the settings defined above on startup.

2. Tab settings

The default tab settings is 8 columns. Some conventions require it be 4 columns. This link, Secrets of tabs in vim, will help in adjusting the defaults.

3. Mapping keys

It means user defined shortcut keys. One good example is mapping to the Windows copy/cut/paste shortcut keys (since the Vim command is not convenient at all).

```
:map  "+y
:map  "+d
:map  "+p
```
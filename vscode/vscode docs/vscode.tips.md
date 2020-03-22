# tips for Visual Studio Code to be productive in 2018

## Live Share

VS Code Live Share is a brand new feature that is still just in developer preview. It allows you to share your workspace in real-time, live editing, pin to user to follow their cursor, group debugging and many more. It’s really helpful if you work remotely or when you need to collaborate with someone who isn’t around.

## JSON to Code

Have you ever been working with an API in TypeScript and wished you could have its response strong-typed in your project. Paste JSON as Code converts your JSON into a interface usable in strong-typed languages with a single command.

## Rename All Occurrences

Refactoring is a necessary aspect of writing and maintaining clean code, but it can be quite the headache — especially when you’re refactoring a large module or an otherwise huge chunk of code. So instead of hunting through dozens of files just to rename a variable or method, let VS Code do it for you.

If you select a variable/method and hit F2, you can edit the name and it will change every instance of that variable’s name throughout the entire current working project.

If you only want to change within the current file, use the Command + F2 (on Mac) or Ctrl + F2 (on Windows) keyboard shortcut and VS Code will spawn a cursor at every instance throughout the current file.

## Go to Definition

When you’re programming or scripting, often times you’ll run into a variable or method that you don’t recognize. So what do you do? You could spend several minutes searching for the right file, or you could press Command (on Mac) or Ctrl (on Windows) key and click the variable/method with your mouse. VS Code will take you to it’s definition right away.

Or you could just hover your cursor over the variable/method along with pressing the Command (on Mac) or Ctrl (on Windows) key, it will shows you the definition right in line where your cursor is.

## Edit Multiple Lines at Once

If you ever need to insert or delete multiple instances of text throughout a document, all you have to do is create multiple cursors. You can do this by holding down Option (on Mac) or Alt (on Windows) and clicking anywhere in the text. Every click creates a new cursor.

This is particularly useful for things like HTML, where you might want to add many instances of the same class or change the format of several hyperlinks.

## Key bindings and the Command Palette

If you want to get things done fast, memorize your hot keys. You can look over the essentials in the cheat sheet or by opening the key bindings page.

The command palette is your best friend. You can open it with Command + P (on Mac) or Ctrl + P (on Windows). As a developer, you’re likely juggling many files simultaneously. Start typing the file name and get full-text search results from the workspace — so much faster than clicking through the directory tree.

- You can start typing with `a >` to get a list of available tasks.
- Or start with an `@` to get a list of symbols in the current file.

## Custom Key bindings

One useful key binding missing from VS code is Save All. Let’s create our own key binding to save all modified files in the workspace with Command + Shift + S (on Mac) or Ctrl + Shift + S (on Windows).

# powershell basics

Help

```
Get-Help Get-Item

help Get-Item

Get-Help Get-Item | Out-Host -Paging

help Get-Item -example

help Get-Item -online
```

Current Location

```
pwd

Get-Location

gl
```

Previous Activity

You can use the familiar UNIX command `history` as well as `ghy` and `h`.

```
Get-History

Get-History -Count 10

Get-History -c 10
```

Printing the last command used

```
$$
```

Printing to the Console

You can use the more familiar `echo` command instead as well as `write`.

```
Write-Output $HOME

Write-Output "Hello"

$value = "Shell Life"
echo $value
```

Creating Multi-Line Commands

```
npm i @fortawesome/fontawesome-svg-core `
@fortawesome/free-solid-svg-icons `
@fortawesome/react-fontawesome
```

Viewing Content of Directories

`ls`, `dir`

```
Get-ChildItem

Get-ChildItem c:/_dev/

Get-ChildItem -Path c:/_dev, c:/Users

gci git

gci /
```

Viewing File Content

```
Get-Content ./readme.md

Get-Content .\readme.md
```

Directory Operations

```
# Creating new dir

New-Item
   [-Path] <String[]>
   -Name <String>
   [-ItemType <String>]

New-Item -ItemType "directory" frameworks

ni -it "directory" frameworks

ni -it "directory" languages, os

ni -it "directory" languages/javascript



# Additional Aliases

md [<Drive>:]<Path>
mkdir [<Drive>:]<Path>



# Deleting a directory
# You can use any of the following aliases with this command: ri, rm, rmdir, del, erase, and rd

Remove-Item
      [-Path] <String[]>
      [<CommonParameters>]

Remove-Item os

ri .\languages\



# Moving a directory
# You can use the following aliases for this command: mi, move, and the common UNIX command, mv.

Move-Item
    [-Path] <String[]>
    [[-Destination] <String>]

ni -it "directory" angular



# Renaming directories

mi .\frameworks\angular\ .\frameworks\react



# Copying directories
# You can use cpi, copy, and the familiar UNIX cp as aliases for Copy-Item.

ni -it "directory" .\frameworks\spring

cpi .\frameworks\spring\ .\employers\
```

File Operations

```
# Creating files

New-Item
   [-Path] <String[]>
   -Name <String>
   [-ItemType <String>]

ni index.js

ni .\frameworks\spring\main.java

ni .\frameworks\django\main.py -f



# Creating multiple files

ni .\frameworks\react\App.js,`
.\frameworks\react\App.css,`
.\frameworks\react\index.css



# Deleting files
# You can use any of the following aliases with this command: ri, rm, del, erase, and rd.

Remove-Item
      [-Path] <String[]>
      [<CommonParameters>]



# Deleting multiple files

ri .\frameworks\react\App.css, .\frameworks\react\App.js



# Moving files

Move-Item
    [-Path] <String[]>
    [[-Destination] <String>]




# Renaming files

mv .\frameworks\angular\index.js .\frameworks\angular\index.ts



# Copying files

gci .\frameworks\angular\




# Creating hidden files

ni .env

(gi .\.env).Attributes += 'Hidden'
```

Navigating the Filesystem

```
cd .\Projects\

cd .\powershell\frameworks\

cd ..

cd ../..

cd .\Projects\powershell\frameworks\angular\

cd ~
```

Combining Commands

```
ni -it "directory" hardware; cd hardware


# It's important to note that the second command will run even if the first one fails. Assume that the hardware folder exists but the colleges folder doesn't. The following commands attempts to create a new file within each of these folders:

ni colleges\mit.html; ni hardware\macbook.html

ni : Could not find a part of the path
```

Finding a File in a Directory `Get-ChildItem` `gci`

```
gci App.css

gci App.css -Force -Recurse
```

Adding Content to a File

```
Add-Content
  [-Path] <string[]>
  [-Value] <Object[]>


gc .\frameworks\react\App.css

ac .\frameworks\react\App.css ".auth0 {}"

gc .\frameworks\react\App.css
```

Finding Text Within Files

```
Select-String
      [-Pattern] <string[]>

gci -Recurse | Select-String -Pattern "auth0"
```

Comparing Two Files

You can also use `diff` and `compare` as aliases.

```
Compare-Object
       [-ReferenceObject] <PSObject[]>
       [-DifferenceObject] <PSObject[]>


Compare-Object `
-ReferenceObject $(Get-Content package.json) `
-DifferenceObject $(Get-Content clone.json)
```

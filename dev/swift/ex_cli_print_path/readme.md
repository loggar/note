# ex - cli_print_path

## Building a Standalone Binary for macOS

After you've updated main.swift in your Xcode project, follow these steps to compile and create a standalone binary:

Open Terminal: Open a terminal window and navigate to your project directory.

Build the Project: Use the xcodebuild command to build your Xcode project or workspace. If your project is straightforward and you're using default settings, simply running xcodebuild in the project directory should be enough. For more complex configurations, you might need to specify schemes or configurations:

```sh
xcodebuild build -scheme print_path -configuration Release
```

This command builds the print_path scheme with the Release configuration. Adjust the scheme name if yours differs.

Locate the Binary: The binary file will be located in your project's build folder, typically under build/Release or a similar path. You can find the exact path in the build logs produced by xcodebuild. It's usually something like:

```
/Users/yourusername/Library/Developer/Xcode/DerivedData/YourProjectName-abcdefghijk/Build/Products/Release/print_path
```

Make the Binary Executable: If needed, ensure the binary is executable by running:

```sh
chmod +x /path/to/your/binary/print_path
```

Move the Binary to a Standard Location: To run the binary from anywhere, move it to a directory included in your $PATH, like /usr/local/bin:

```sh
mv /path/to/your/binary/print_path /usr/local/bin/
```

Run Your Command: Now, you should be able to run print_path directly from any terminal window:

```sh
print_path
```

This process compiles your Swift code into a binary executable for macOS. By placing the binary in a directory included in your $PATH, you make it accessible from anywhere in the terminal.

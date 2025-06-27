# Remove Ollama and DeepSeek Models from macOS

## Quick Overview

Ollama stores models and data in several locations on macOS. Complete removal requires cleaning multiple directories and stopping services.

## Step 1: Stop Ollama Service

```bash
# Stop Ollama service if running
pkill ollama

# Check if Ollama is still running
ps aux | grep ollama

# Force kill if necessary
sudo pkill -9 ollama
```

## Step 2: Remove Ollama Models

### List Current Models

```bash
# Check what models are installed
ollama list

# Check model storage size
du -sh ~/.ollama/models
```

### Remove All Models

```bash
# Remove individual models (if Ollama is still working)
ollama rm deepseek-coder
ollama rm deepseek-chat
ollama rm llama2
ollama rm codellama
ollama rm mistral

# Or remove all models at once
ollama rm $(ollama list | tail -n +2 | awk '{print $1}')

# Direct removal of model directory
rm -rf ~/.ollama/models
```

## Step 3: Uninstall Ollama Application

### Remove Ollama App (if installed via installer)

```bash
# Remove application
sudo rm -rf /Applications/Ollama.app

# Remove from /usr/local/bin if installed there
sudo rm -f /usr/local/bin/ollama

# Remove from /opt/homebrew/bin if installed via Homebrew
sudo rm -f /opt/homebrew/bin/ollama
```

### If Installed via Homebrew

```bash
# Uninstall Ollama via Homebrew
brew uninstall ollama

# Remove any remaining Homebrew dependencies
brew autoremove
```

## Step 4: Remove Ollama Data Directories

### Main Ollama Directory

```bash
# Check directory size first
du -sh ~/.ollama

# Remove entire Ollama directory
rm -rf ~/.ollama
```

### System-wide Ollama Files

```bash
# Remove system-wide files (if any)
sudo rm -rf /usr/local/share/ollama
sudo rm -rf /opt/ollama

# Remove configuration files
rm -rf ~/Library/Application\ Support/Ollama
rm -rf ~/Library/Preferences/com.ollama.*
rm -rf ~/Library/Caches/ollama
```

## Step 5: Remove DeepSeek-Specific Files

### DeepSeek Models in Ollama

```bash
# Models are typically stored in ~/.ollama/models/
# DeepSeek models might be named like:
ls -la ~/.ollama/models/blobs/sha256-* | grep -i deepseek

# Remove specific DeepSeek model blobs (if identifiable)
# This is usually handled by removing ~/.ollama/models above
```

### Other DeepSeek Installations

```bash
# Check for standalone DeepSeek installations
find /Applications -name "*deepseek*" -o -name "*DeepSeek*"
find ~/Applications -name "*deepseek*" -o -name "*DeepSeek*"

# Remove if found
rm -rf /Applications/DeepSeek*
rm -rf ~/Applications/DeepSeek*

# Check for DeepSeek CLI tools
which deepseek
sudo rm -f /usr/local/bin/deepseek
sudo rm -f /opt/homebrew/bin/deepseek
```

## Step 6: Clean System Services and LaunchAgents

### Check for Ollama Services

```bash
# Check for LaunchDaemons
ls -la /Library/LaunchDaemons/*ollama*
sudo rm -f /Library/LaunchDaemons/*ollama*

# Check for LaunchAgents
ls -la /Library/LaunchAgents/*ollama*
sudo rm -f /Library/LaunchAgents/*ollama*

# Check user LaunchAgents
ls -la ~/Library/LaunchAgents/*ollama*
rm -f ~/Library/LaunchAgents/*ollama*
```

### Unload Services (if running)

```bash
# Unload any running services
sudo launchctl unload /Library/LaunchDaemons/*ollama* 2>/dev/null
launchctl unload ~/Library/LaunchAgents/*ollama* 2>/dev/null
```

## Step 7: Remove Environment Variables and Shell Configurations

### Check Shell Configuration Files

```bash
# Check for Ollama-related environment variables
grep -r "ollama\|OLLAMA" ~/.zshrc ~/.bash_profile ~/.bashrc ~/.profile 2>/dev/null

# Check for DeepSeek-related configurations
grep -r "deepseek\|DEEPSEEK" ~/.zshrc ~/.bash_profile ~/.bashrc ~/.profile 2>/dev/null
```

### Remove Configuration Lines

```bash
# Edit your shell configuration file
code ~/.zshrc  # or vim ~/.zshrc

# Remove lines containing:
# - export OLLAMA_*
# - alias ollama=*
# - PATH additions for Ollama
# - Any DeepSeek-related configurations

# Reload shell configuration
source ~/.zshrc
```

## Step 8: Clean Docker Containers (if used)

### Remove Ollama Docker Containers

```bash
# Stop and remove Ollama containers
docker stop $(docker ps -a | grep ollama | awk '{print $1}')
docker rm $(docker ps -a | grep ollama | awk '{print $1}')

# Remove Ollama images
docker rmi $(docker images | grep ollama | awk '{print $3}')

# Remove DeepSeek containers/images
docker stop $(docker ps -a | grep deepseek | awk '{print $1}')
docker rm $(docker ps -a | grep deepseek | awk '{print $1}')
docker rmi $(docker images | grep deepseek | awk '{print $3}')

# Clean up unused Docker resources
docker system prune -a -f
```

## Step 9: Verification

### Check for Remaining Files

```bash
# Search for any remaining Ollama files
find / -name "*ollama*" 2>/dev/null | grep -v "/proc\|/sys"

# Search for DeepSeek files
find / -name "*deepseek*" 2>/dev/null | grep -v "/proc\|/sys"

# Check if commands still exist
which ollama
which deepseek

# Check running processes
ps aux | grep -i ollama
ps aux | grep -i deepseek
```

### Verify Disk Space Recovery

```bash
# Check disk space before and after
df -h

# Check specific directories that should be gone
ls -la ~/.ollama 2>/dev/null || echo "~/.ollama successfully removed"
ls -la /Applications/Ollama.app 2>/dev/null || echo "Ollama app successfully removed"
```

## Step 10: Complete Cleanup Script

### Automated Removal Script

```bash
cat > ~/remove_ollama_deepseek.sh << 'EOF'
#!/bin/bash

echo "🗑️  Starting Ollama and DeepSeek removal process..."

# Stop services
echo "Stopping Ollama processes..."
pkill ollama
sleep 2
sudo pkill -9 ollama 2>/dev/null

# Remove Ollama application
echo "Removing Ollama application..."
sudo rm -rf /Applications/Ollama.app
sudo rm -f /usr/local/bin/ollama
sudo rm -f /opt/homebrew/bin/ollama

# Try Homebrew uninstall
if command -v brew &> /dev/null; then
    echo "Attempting Homebrew uninstall..."
    brew uninstall ollama 2>/dev/null || echo "Ollama not installed via Homebrew"
fi

# Remove data directories
echo "Removing Ollama data directories..."
rm -rf ~/.ollama
rm -rf ~/Library/Application\ Support/Ollama
rm -rf ~/Library/Preferences/com.ollama.*
rm -rf ~/Library/Caches/ollama
sudo rm -rf /usr/local/share/ollama
sudo rm -rf /opt/ollama

# Remove DeepSeek
echo "Removing DeepSeek installations..."
rm -rf /Applications/DeepSeek*
rm -rf ~/Applications/DeepSeek*
sudo rm -f /usr/local/bin/deepseek
sudo rm -f /opt/homebrew/bin/deepseek

# Remove services
echo "Removing system services..."
sudo rm -f /Library/LaunchDaemons/*ollama*
sudo rm -f /Library/LaunchAgents/*ollama*
rm -f ~/Library/LaunchAgents/*ollama*

# Clean Docker
if command -v docker &> /dev/null; then
    echo "Cleaning Docker containers and images..."
    docker stop $(docker ps -a | grep -E "(ollama|deepseek)" | awk '{print $1}') 2>/dev/null
    docker rm $(docker ps -a | grep -E "(ollama|deepseek)" | awk '{print $1}') 2>/dev/null
    docker rmi $(docker images | grep -E "(ollama|deepseek)" | awk '{print $3}') 2>/dev/null
fi

echo "✅ Removal process completed!"
echo "Please check your shell configuration files (~/.zshrc, ~/.bash_profile) for any remaining Ollama/DeepSeek references."
echo "You may need to restart your terminal or run 'source ~/.zshrc' to refresh your environment."

# Verification
echo "🔍 Verification:"
if ! command -v ollama &> /dev/null; then
    echo "✅ Ollama command not found"
else
    echo "⚠️  Ollama command still exists"
fi

if [ ! -d ~/.ollama ]; then
    echo "✅ ~/.ollama directory removed"
else
    echo "⚠️  ~/.ollama directory still exists"
fi

df -h
EOF

chmod +x ~/remove_ollama_deepseek.sh

# Run the script
~/remove_ollama_deepseek.sh
```

## Space Recovery Estimate

### Typical Space Recovery:

- **Ollama Models**: 2-50GB+ (depending on models installed)
- **DeepSeek Models**: 7-15GB per model
- **Application Files**: 100-500MB
- **Cache and Logs**: 100MB-1GB

### Common Large Models:

- **deepseek-coder**: ~7GB
- **deepseek-chat**: ~7GB
- **llama2**: ~4GB
- **codellama**: ~7GB
- **mistral**: ~4GB

## Manual Cleanup if Script Fails

If the automated script doesn't work completely:

```bash
# Manual verification and cleanup
sudo find / -name "*ollama*" -exec rm -rf {} \; 2>/dev/null
sudo find / -name "*deepseek*" -exec rm -rf {} \; 2>/dev/null

# Reset shell environment
unset OLLAMA_HOST
unset OLLAMA_API_BASE
hash -r

# Restart terminal
exec $SHELL
```

## Reinstallation (if needed later)

If you want to reinstall Ollama later:

```bash
# Via Homebrew
brew install ollama

# Or download from official site
# https://ollama.ai/download

# Start service
ollama serve
```

**⚠️ Warning**: This process will permanently delete all your Ollama models and configurations. Make sure you have backups of any important model configurations or custom models before proceeding.

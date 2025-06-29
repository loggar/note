# macOS Disk Space Cleanup Guide

## Quick Assessment

### Check Current Disk Usage

```bash
# Basic disk usage check
df -h

# Check what's using the most space
du -sh /* 2>/dev/null | sort -rh | head -10

# Check user directory usage
du -sh ~/* | sort -rh | head -10
```

## Immediate Cleanup Commands

### 1. System Caches and Logs

```bash
# Clean user cache files
rm -rf ~/Library/Caches/*

# Clean system logs (requires admin)
sudo rm -rf /private/var/log/asl/*.asl
sudo rm -rf /Library/Logs/*

# Clean user logs
rm -rf ~/Library/Logs/*

# Clean crash reports
rm -rf ~/Library/Application\ Support/CrashReporter/*
sudo rm -rf /Library/Application\ Support/CrashReporter/*
```

### 2. Downloads and Temporary Files

```bash
# Check Downloads folder
ls -lah ~/Downloads/ | head -20

# Clean Downloads (be careful, check first!)
# rm ~/Downloads/*

# Clean Trash
rm -rf ~/.Trash/*
```

### 3. Browser Caches

```bash
# Safari cache
rm -rf ~/Library/Caches/com.apple.Safari/*

# Chrome cache
rm -rf ~/Library/Caches/Google/Chrome/*

# Firefox cache
rm -rf ~/Library/Caches/Firefox/*

# Edge cache
rm -rf ~/Library/Caches/com.microsoft.edgemac/*
```

## Developer-Specific Cleanup

### Xcode and iOS Development

```bash
# Clean Xcode derived data (can be large!)
rm -rf ~/Library/Developer/Xcode/DerivedData/*

# Clean Xcode caches
rm -rf ~/Library/Caches/com.apple.dt.Xcode/*

# Clean iOS device support files
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/*

# Clean simulator logs
rm -rf ~/Library/Logs/CoreSimulator/*

# Delete unavailable simulators
xcrun simctl delete unavailable

# Erase all simulator data (CAUTION: removes all simulator data)
xcrun simctl erase all

# Clean old Xcode archives (check first!)
ls -lah ~/Library/Developer/Xcode/Archives/
# rm -rf ~/Library/Developer/Xcode/Archives/old_date_folders

# Clean iOS Simulator volumes (if mounted and full)
sudo rm -rf /Library/Developer/CoreSimulator/Volumes/iOS_*/
```

### Docker Cleanup

```bash
# Clean Docker system
docker system prune -a --volumes

# Remove all stopped containers
docker container prune -f

# Remove all unused images
docker image prune -a -f

# Remove all unused volumes
docker volume prune -f

# Remove all unused networks
docker network prune -f

# Check Docker disk usage
docker system df
```

### Node.js and npm

```bash
# Clean npm cache
npm cache clean --force

# Clean yarn cache (if using yarn)
yarn cache clean

# Find and clean node_modules directories
find ~ -name "node_modules" -type d -prune -exec du -sh {} \; | sort -rh | head -10

# Remove specific large node_modules (be careful!)
# find ~ -name "node_modules" -type d -prune -exec rm -rf {} \;
```

### Python and pip

```bash
# Clean pip cache
pip cache purge

# Clean Python cache files
find ~ -name "*.pyc" -delete
find ~ -name "__pycache__" -type d -exec rm -rf {} +

# Clean conda cache (if using conda)
conda clean -a
```

## Application-Specific Cleanup

### Mail and Messages

```bash
# Clean Mail attachments (check first!)
ls -lah ~/Library/Mail/V*/MailData/Attachments/

# Clean Messages attachments
ls -lah ~/Library/Messages/Attachments/

# Note: Be very careful with these, backup important attachments first
```

### Photos and Media

```bash
# Check Photos library size
ls -lah ~/Pictures/Photos\ Library.photoslibrary

# Check for duplicate files
brew install fdupes
fdupes -r ~/Pictures

# Check Movies folder
du -sh ~/Movies/*

# Check Music library
du -sh ~/Music/*
```

### Adobe Creative Cloud

```bash
# Clean Adobe cache
rm -rf ~/Library/Caches/Adobe/*
rm -rf ~/Library/Caches/com.adobe.*

# Clean After Effects cache
rm -rf ~/Library/Caches/Adobe/After\ Effects/*

# Clean Premiere Pro cache
rm -rf ~/Library/Caches/Adobe/Premiere\ Pro/*
```

## Homebrew Cleanup

### Clean Homebrew Files

```bash
# Clean Homebrew cache
brew cleanup

# Remove old versions
brew cleanup --prune=all

# Check what's using space
brew --cache
du -sh $(brew --cache)

# Clean specific formula caches
brew cleanup --prune=0

# Remove broken symlinks
brew cleanup --dry-run
```

## System Cleanup

### Language Files (Advanced)

```bash
# Check language files (CAUTION: can break applications)
sudo find /Applications -name "*.lproj" | grep -v English.lproj | head -20

# Use third-party tool for safe language file removal
# brew install monolingual
```

### Kernel Extensions and System Files

```bash
# Check kernel extension cache
ls -lah /System/Library/Extensions/

# Clean font cache
sudo atsutil databases -remove

# Clean DNS cache
sudo dscacheutil -flushcache
```

## Automated Cleanup Scripts

### Daily Cleanup Script

```bash
cat > ~/Scripts/daily_cleanup.sh << 'EOF'
#!/bin/bash
echo "Starting daily macOS cleanup..."

# Clean user caches
rm -rf ~/Library/Caches/* 2>/dev/null

# Clean logs
rm -rf ~/Library/Logs/* 2>/dev/null

# Clean trash
rm -rf ~/.Trash/* 2>/dev/null

# Clean browser caches
rm -rf ~/Library/Caches/com.apple.Safari/* 2>/dev/null
rm -rf ~/Library/Caches/Google/Chrome/* 2>/dev/null

echo "Daily cleanup completed: $(date)"
df -h / | tail -1
EOF

chmod +x ~/Scripts/daily_cleanup.sh
```

### Weekly Deep Cleanup Script

```bash
cat > ~/Scripts/weekly_cleanup.sh << 'EOF'
#!/bin/bash
echo "Starting weekly deep cleanup..."

# Run daily cleanup first
~/Scripts/daily_cleanup.sh

# Clean Docker
if command -v docker &> /dev/null; then
    docker system prune -a -f --volumes
fi

# Clean Homebrew
if command -v brew &> /dev/null; then
    brew cleanup --prune=all
fi

# Clean Xcode (if exists)
if [ -d "~/Library/Developer/Xcode" ]; then
    rm -rf ~/Library/Developer/Xcode/DerivedData/* 2>/dev/null
    xcrun simctl delete unavailable 2>/dev/null
fi

# Clean npm cache
if command -v npm &> /dev/null; then
    npm cache clean --force 2>/dev/null
fi

echo "Weekly cleanup completed: $(date)"
df -h / | tail -1
EOF

chmod +x ~/Scripts/weekly_cleanup.sh

# Schedule weekly cleanup
echo "0 2 * * 0 ~/Scripts/weekly_cleanup.sh" | crontab -
```

## Safe Cleanup Tools

### Third-Party Applications

```bash
# Install cleanup tools via Homebrew
brew install --cask cleanmymac
brew install --cask onyx
brew install --cask disk-utility

# Command-line tools
brew install ncdu      # Interactive disk usage
brew install dust      # Modern du alternative
brew install dua-cli   # Disk usage analyzer
```

### Built-in macOS Tools

```bash
# Use macOS Storage Management
# Apple Menu → About This Mac → Storage → Manage

# Storage optimization recommendations:
# - Store in iCloud
# - Optimize storage
# - Empty Trash automatically
# - Reduce clutter
```

## Monitoring and Prevention

### Setup Disk Usage Monitoring

```bash
cat > ~/Scripts/disk_monitor.sh << 'EOF'
#!/bin/bash
THRESHOLD=80
USAGE=$(df -h / | tail -1 | awk '{print $5}' | cut -d'%' -f1)

if [ $USAGE -ge $THRESHOLD ]; then
    echo "⚠️  Disk usage is at ${USAGE}% - Running cleanup..."
    ~/Scripts/daily_cleanup.sh

    # Send notification (macOS)
    osascript -e "display notification \"Disk cleanup completed\" with title \"Storage Alert\""
fi
EOF

chmod +x ~/Scripts/disk_monitor.sh

# Check every hour
echo "0 * * * * ~/Scripts/disk_monitor.sh" | crontab -
```

### Create Aliases for Quick Cleanup

```bash
# Add to ~/.zshrc or ~/.bash_profile
cat >> ~/.zshrc << 'EOF'
# Disk cleanup aliases
alias cleanup-basic='rm -rf ~/Library/Caches/* && rm -rf ~/Library/Logs/* && rm -rf ~/.Trash/*'
alias cleanup-docker='docker system prune -a -f --volumes'
alias cleanup-brew='brew cleanup --prune=all'
alias cleanup-xcode='rm -rf ~/Library/Developer/Xcode/DerivedData/* && xcrun simctl delete unavailable'
alias cleanup-all='cleanup-basic && cleanup-docker && cleanup-brew && cleanup-xcode'
alias disk-usage='df -h && echo "" && du -sh ~/* | sort -rh | head -10'

# Show disk space
alias ds='df -h'
alias du-top='du -sh * | sort -rh | head -10'
EOF

# Reload configuration
source ~/.zshrc
```

## Emergency Space Recovery

### When Disk is 95%+ Full

```bash
# Immediate actions (in order of safety)
echo "Emergency cleanup starting..."

# 1. Empty Trash immediately
rm -rf ~/.Trash/*

# 2. Clean caches
rm -rf ~/Library/Caches/*

# 3. Clean logs
rm -rf ~/Library/Logs/*
sudo rm -rf /private/var/log/*

# 4. Clean Downloads
ls -lah ~/Downloads/
# Manually remove large files

# 5. Docker nuclear option
docker system prune -a -f --volumes

# 6. Check results
df -h /
echo "Emergency cleanup completed"
```

## Recovery Estimates

### Typical Space Recovery by Category:

- **User Caches**: 1-5GB
- **Browser Caches**: 500MB-2GB
- **Xcode DerivedData**: 5-20GB
- **Docker**: 2-10GB
- **Homebrew Cache**: 1-3GB
- **npm/node_modules**: 1-10GB
- **System Logs**: 100MB-1GB
- **Downloads**: Varies widely
- **Trash**: Varies widely

### Before You Start:

1. **Backup important data**
2. **Check what you're deleting**
3. **Start with safest cleanups first**
4. **Monitor results with `df -h`**

### Note:

Always be cautious when deleting files. When in doubt, move files to a temporary folder first, test your system, then delete permanently.

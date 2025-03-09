# brew

## Update daily

```sh
# Function to check if brew update has run today
brew_update_daily() {
  # Check if the timestamp file exists
  if [ ! -f "$BREW_UPDATE_FILE" ]; then
    touch "$BREW_UPDATE_FILE"
    echo "[Running first brew update of the day]"
    brew update
    date +%Y%m%d > "$BREW_UPDATE_FILE"
    return
  fi

  # Get current date in YYYYMMDD format
  CURRENT_DATE=$(date +%Y%m%d)

  # Get last update date from file
  LAST_UPDATE=$(cat "$BREW_UPDATE_FILE")

  # If dates don't match, run update
  if [ "$CURRENT_DATE" != "$LAST_UPDATE" ]; then
    echo "Running first brew update of the day..."
    brew update
    echo "$CURRENT_DATE" > "$BREW_UPDATE_FILE"
  fi
}

# Run the function when terminal starts
brew_update_daily
```

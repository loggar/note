# geographic location from ip address

## get my ip

```
curl https://ipinfo.io/ip
```

## get location data from the `ipvigilante.com`

```
curl https://ipvigilante.com/<your ip address>
```

```json
{
  "status": "success",
  "data": {
    "ipv4": "112.213.***.***",
    "continent_name": "Oceania",
    "country_name": "Australia",
    "subdivision_1_name": null,
    "subdivision_2_name": null,
    "city_name": null,
    "latitude": "-33.49400",
    "longitude": "143.21040"
  }
}
```

## Creating a Script to Automate The API Call

`geolocate.sh`

```sh
#!/bin/sh

OUTPUT_FILE=/tmp/server_location.txt

# Grab this server's public IP address
PUBLIC_IP=`curl -s https://ipinfo.io/ip`

# Call the geolocation API and capture the output
curl -s https://ipvigilante.com/${PUBLIC_IP} | \
        jq '.data.latitude, .data.longitude, .data.city_name, .data.country_name' | \
        while read -r LATITUDE; do
                read -r LONGITUDE
                read -r CITY
                read -r COUNTRY
                echo "${LATITUDE},${LONGITUDE},${CITY},${COUNTRY}" | \
                        tr --delete \" > \
                        ${OUTPUT_FILE}
        done
```

Make the script executable from the terminal, by granting the execute permission on this file.

```
chmod u+x geolocate.sh
```

```
./geolocate.sh
cat /tmp/server_location.txt
```

## Updating the Geolocation Data Once a Day With a Cron Job

Let’s create a cron job to make our server update its geolocation and save it to a file once a day. The daily cron job updates a file called `server_location.txt` in the `/tmp/` folder of the server. Creating a 24-hour cron job is as easy as putting our script into the `/etc/cron.daily` directory. We must use the sudo command to copy the file as the root user, to avoid permission issues. Run the following command to copy `geolocate.sh` to the `/etc/cron.daily` directory.

```
sudo cp geolocate.sh /etc/cron.daily
```

These changes are immediate, and our script will run every 24 hours to update the contents of the `/tmp/server_location.tx`t file. We can use this data to do interesting things, such as plotting our servers on a map as well as combining geolocation with traffic logs to see where in the world our server hotspots are.

# ~/.config/waybar/scripts/weather.zsh
#!/usr/bin/env zsh
CITY="Melbourne,AU"
API_KEY="$OPENWEATHER_API_KEY"
WEATHER=$(curl -sf "https://api.openweathermap.org/data/2.5/weather?q=$CITY&appid=$API_KEY&units=metric")
TEMP=$(jq -r '.main.temp' <<< "$WEATHER")
DESC=$(jq -r '.weather[0].description' <<< "$WEATHER")
echo "🌤 ${TEMP}°C ${DESC}"


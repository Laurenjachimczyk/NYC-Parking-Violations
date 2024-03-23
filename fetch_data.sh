echo "Starting.."

offset=0
limit=1000
output_file="parking_violations.csv"
iteration=0

# Define the list of columns to fetch
columns="summons_number,plate_id,registration_state,issue_date,vehicle_make,vehicle_year,street_name,vehicle_color"

# Get first 1000 rows and write to file
curl "https://data.cityofnewyork.us/resource/pvqr-7yc4.csv?\$select=$columns&\$limit=$limit&\$offset=$offset" > "$output_file"

# Get remaining data in increments of 1000 rows and append to file
while true; do
    iteration=$((iteration + 1))
    echo "Iteration: $iteration"

    # Print API url to confirm offset is updating 
    api_url="https://data.cityofnewyork.us/resource/pvqr-7yc4.csv?\$select=$columns&\$limit=$limit&\$offset=$((offset + limit))"
    echo "API request URL: $api_url"

    # Get and append to file
    curl "$api_url" >> "$output_file"

    # Check if all data is there
    if [ $(wc -l < "$output_file") -lt $((offset + limit)) ]; then
        echo "All data fetched."
        break
    fi

    offset=$((offset + limit))

done

echo "Data fetched and saved to $output_file"

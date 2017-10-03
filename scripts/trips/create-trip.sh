#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/trips"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "trip": {
      "place_name": "'"${PLACE_NAME}"'",
      "departing_date": "'"${DEPARTING_DATE}"'",
      "returning_date": "'"${RETURNING_DATE}"'",
      "travel_duration": "'"${TRAVEL_DURATION}"'",
      "transportation": "'"${TRANSPORTATION}"'",
      "accomodation": "'"${ACCOMODATION}"'",
      "eat": "'"${EAT}"'",
      "activities": "'"${ACTIVITIES}"'"
    }
  }'

echo

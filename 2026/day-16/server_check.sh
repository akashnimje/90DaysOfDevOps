#!/bin/bash

SERVICE="nginx"

read -p "Do you want to check the status of $SERVICE? (y/n): " CHOICE

if [ "$CHOICE" = "y" ]; then
  systemctl status $SERVICE
elif [ "$CHOICE" = "n" ]; then
  echo "Skipped."
else
  echo "Invalid choice"
fi

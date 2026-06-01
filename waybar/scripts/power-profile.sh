#!/bin/bash
# Detect your power state — replace this logic with your actual check
profile=$(cat /sys/firmware/acpi/platform_profile)  # outputs "performance" or "balanced" or  "low-power"


printf '{"alt": "%s", "tooltip": "%s"}\n' "$profile" "$profile"

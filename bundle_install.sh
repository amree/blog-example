#!/bin/bash

set -euo pipefail

# Pre-installation
if [ -f /run/secrets/bundle_credentials ]; then
  export $(grep -v '^#' /run/secrets/bundle_credentials | xargs)
fi

# Run installation
bundle install --jobs "$(nproc)"

# Cleanup

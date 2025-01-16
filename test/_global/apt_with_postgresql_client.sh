#!/bin/bash

# The 'test/_global' folder is a special test folder that is not tied to a single feature.
#
# This test file is executed against a running container constructed
# from the value of 'all_features' in the tests/_global/scenarios.json file.
#
# The value of a scenarios element is any properties available in the 'devcontainer.json'.
# Scenarios are useful for testing specific options in a feature, or to test a combination of features.
#
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test --global-scenarios-only .

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
# Check if libpq-dev is installed
check "libpq-dev installed" bash -c "dpkg -l | grep libpq-dev"

# Check if PostgreSQL client (version 17) is installed
check "PostgreSQL client version 17 installed" bash -c "psql --version | grep -E 'PostgreSQL.*17(\.[0-9]+)?'"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults

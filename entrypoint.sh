#!/bin/sh

set -e

# Respect RELEASE_VERSION if specified
[ -n "$RELEASE_VERSION" ] || export RELEASE_VERSION="${SENTRY_PROJECT}@$(git describe --always --long)"

# Capture output
output=$(
sentry-cli releases new $RELEASE_VERSION
sentry-cli releases set-commits --auto $RELEASE_VERSION
sentry-cli releases deploys $RELEASE_VERSION new -e $ENVIRONMENT
)

# Preserve output for consumption by downstream actions
echo "$output" > "${HOME}/${GITHUB_ACTION}.${log}"


# Write output to STDOUT
echo "$output"

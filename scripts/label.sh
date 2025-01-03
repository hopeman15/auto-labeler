#!/usr/bin/env bash

set -o pipefail

GITHUB_TOKEN="${GITHUB_TOKEN:?GITHUB_TOKEN is not set}"
PR_NUMBER="${PR_NUMBER:?PR_NUMBER is not set}"
REPO="${REPO:?REPO is not set}"

PR_TITLE=$(gh pr view "$PR_NUMBER" -R "$REPO" --json title -q '.title')

add_label() {
    local label="$1"
    local keyword="$2"
    if [[ "$PR_TITLE" == *"$keyword"* ]]; then
        echo "Adding label: $label for keyword: $keyword"
        gh pr edit "$PR_NUMBER" --add-label "$label" -R "$REPO"
    fi
}

# Default labeling
add_label "bug :bug:" "Bug"
add_label "bug :bug:" "Fix"
add_label "CI/CD :cd:" "CI/CD"
add_label "dependencies" "Dependency"
add_label "dependencies" "Dependencies"
add_label "documentation :book:" "Documentation"
add_label "enhancement :sparkles:" "Enhancement"
add_label "feature :moneybag:" "Feature"
add_label "housekeeping :broom:" "Housekeeping"
add_label "housekeeping :broom:" "Refactoring"
add_label "release :tada:" "Release"
add_label "testing :test_tube:" "Testing"

echo "Labeling completed."

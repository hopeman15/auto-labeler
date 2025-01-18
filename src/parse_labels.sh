#!/usr/bin/env bash

set -o pipefail

KEYWORDS="${KEYWORDS:-Bug,CI/CD,Dependencies,Dependency,Documentation,Enhancement,Feature,Fix,Housekeeping,Refactoring,Release,Testing}"
LABELS="${LABELS:-bug :bug:,CI/CD :cd:,dependencies,dependencies,documentation :book:,enhancement :sparkles:,feature :moneybag:,bug :bug:,housekeeping :broom:,housekeeping :broom:,release :tada:,testing :test_tube:}"

IFS=',' read -ra keyword_array <<< "$KEYWORDS"
IFS=',' read -ra label_array <<< "$LABELS"

if [[ ${#keyword_array[@]} -ne ${#label_array[@]} ]]; then
    echo "Error: The number of KEYWORDS does not match the number of LABELS."
    exit 1
fi

for i in "${!keyword_array[@]}"; do
    echo "${keyword_array[$i]},${label_array[$i]}"
done

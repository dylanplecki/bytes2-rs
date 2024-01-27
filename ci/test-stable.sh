#!/bin/bash

set -ex

cmd="${1:-test}"

# Run with each feature
# * --each-feature includes both default/no-default features
# * --exclude-features will not test any nightly-only features
# * --optional-deps is needed for serde feature
cargo hack "${cmd}" --each-feature --exclude-features allocator_api,core_io_borrowed_buf --optional-deps

# Run with all stable features
cargo "${cmd}" --feature std

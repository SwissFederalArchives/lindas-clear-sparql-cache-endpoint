# clear-sparql-cache-endpoint

## Unreleased

### Minor Changes

- Add one-click cache purge workflows per environment (`purge-test.yaml`, `purge-int.yaml`, `purge-prod.yaml`)
  - Each workflow is triggered via `workflow_dispatch` (Run workflow button in GitHub Actions)
  - Runs the Docker image directly in GitHub Actions to purge all cached SPARQL responses
  - S3 disabled so manual purges do not interfere with CronJob state tracking
  - Requires `CACHE_ENDPOINT_PASSWORD` secret configured per GitHub environment (test, int, prod)

### Patch Changes

- Fix promote workflow: replace `${{ github.repository }}` with hardcoded lowercase image path to prevent Docker registry errors (GHCR requires all-lowercase paths)

### Previous Changes

- Fix npm audit vulnerabilities: update @aws-sdk/client-s3 (fast-xml-parser DoS) and lodash (prototype pollution)
- Standardize Docker image tag naming: changed from `main-YYYYMMDD-HHmmss` to `test_YYYY-MM-DD_HHmmss`
- Updated promote/rollback workflow to use `test_*` tags for TEST rollback
- Add promote/rollback workflow (`promote.yaml`) via `workflow_dispatch`
  - Action dropdown: promote, rollback-test, rollback-int, rollback-prod
  - Promote: retags source image as `int_YYYY-MM-DD_HHMMSS` then `prod_YYYY-MM-DD_HHMMSS`
  - Rollback: retags a previous image with a new timestamp so Flux picks it up
  - Uses `docker buildx imagetools create` for zero-layer-pull retagging (no rebuild)

## 0.3.2

### Patch Changes

- bcdab75: Fix handling date data type.

## 0.3.1

### Patch Changes

- 497f5c6: All results were returned as strings, which was breaking the logic.

  Now, everything is converted as dateTime, and it assumes that a date having hours, minutes and seconds set to zero is a value converted from a date.

## 0.3.0

### Minor Changes

- 8781867: Change the SPARQL query in order to add more results

## 0.2.0

### Minor Changes

- 910151e: Simple date workaround using S3

## 0.1.0

### Minor Changes

- 831ff83: First release

# clear-sparql-cache-endpoint

## Unreleased

### Patch Changes

- Add timestamp-based Docker tags (`main-YYYYMMDD-HHmmss`) for Flux image automation on TEST
- Add promotion workflow (`promote.yaml`) for INT/PROD via `workflow_dispatch`
  - Takes a `source_tag` input (the TEST image tag to promote)
  - Retags the existing image (no rebuild) as `int_YYYY-MM-DD_HHMMSS` and `prod_YYYY-MM-DD_HHMMSS`
  - Uses `docker buildx imagetools create` for zero-layer-pull retagging

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

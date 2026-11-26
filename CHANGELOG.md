# clear-sparql-cache-endpoint

## 0.3.4

### Patch Changes

- e4f46f3: Update Changesets CLI to v3, use the git-tag command for release tags, and explicitly enable versioning and tagging for this private package.
- f5c75c4: Update Docker build and push action from v6 to v7 for container image publishing.
- ef5b046: Update Docker Buildx setup action from v3 to v4 for container builds and image promotion.
- da35f24: Update Docker metadata action from v5 to v6 for container image tags and labels.
- 2798e30: Update Docker QEMU setup action from v3 to v4 for multi-platform container builds.
- c81f538: Update dotenv from 17.2.3 to 18.0.9 for environment configuration loading.
- bf05514: Update ESLint from 10.13.0 to 10.14.0 for development linting.
- 162a5e8: Update globals from 17.13.0 to 17.14.0 for development linting.

## 0.3.3

### Patch Changes

- 9e42dfe: Pin the container runtime to Node.js 22.23.4 to fix CVE-2026-111497 in the bundled Brotli decoder. Align local and CI runtime requirements and enable Docker dependency updates. Rebuild and redeploy container images to apply the fix.

  Update vulnerable transitive dependencies in the lockfile to patched versions so the CI security audit passes for production and development dependencies.

## Unreleased

### Patch Changes

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

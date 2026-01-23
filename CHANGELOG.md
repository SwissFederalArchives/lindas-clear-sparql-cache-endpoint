# lindas-clear-sparql-cache-endpoint Changelog

**Repository:** SwissFederalArchives/lindas-clear-sparql-cache-endpoint
**Description:** Endpoint service to clear SPARQL query cache

---

## LINDAS Development (January 2026)

### 2026-01-23

**DevOps Workflow Implementation**
- Created `develop` branch for code review workflow
- Updated CI workflow to trigger on develop branch and PRs
- Updated Docker workflow to build (verify) on develop without pushing
- Docker images only pushed on main branch and version tags
- Added `promote.yaml` workflow for creating promotion PRs (develop -> main)
- Added `rollback.yaml` workflow for rolling back to previous versions
- Added development workflow documentation to README

---

## LINDAS Development (December 2025)

### 2025-12-04

**`22083aa` - Fix Dockerfile to use npm install instead of npm ci**
- Fixed Dockerfile build process for compatibility

**`45d22ca` - Initialize changesets for release management**
- Added changesets for automated versioning

**`3b8ed6f` - Use npm install instead of npm ci for CI compatibility**
- Fixed CI workflow compatibility

**`414b68b` - Update CI to use Node.js 22 for consistency**
- Upgraded CI to Node.js 22

**`1b0cdbd` - Regenerate package-lock.json for CI compatibility**
- Fixed lockfile for CI builds

**`60b529e` - Fix release workflow to use default GITHUB_TOKEN**
- Fixed release automation

**`e2e741f` - Fix security vulnerabilities and add CI workflow**
- Fixed security vulnerabilities in dependencies
- Added GitHub Actions CI workflow

### 2025-10-17

**`a805a20` - Initial mirror from rareba/clear-sparql-cache-endpoint**
- Initial repository setup from original rareba repository

---

## Original Releases

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

---

*Last updated: 2026-01-23*

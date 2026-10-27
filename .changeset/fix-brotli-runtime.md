---
"clear-sparql-cache-endpoint": patch
---

Pin the container runtime to Node.js 22.23.4 to fix CVE-2026-111497 in the bundled Brotli decoder. Align local and CI runtime requirements and enable Docker dependency updates. Rebuild and redeploy container images to apply the fix.

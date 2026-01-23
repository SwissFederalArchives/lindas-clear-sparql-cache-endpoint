# Clear SPARQL cache endpoint

This assumes that your cached endpoint is using Varnish and has the `xkey` module enabled.
You can take a look at our custom [varnish-post](https://github.com/zazuko/varnish-post) repository that comes with all required configuration for the cached endpoint.

## Get started

```sh
npm install # Install dependencies
cp example.env .env # Copy environment variables file
# Open your editor, and fill the environment variables in the `.env` file
npm run start # Start the script
```

## Environment variables

| Name                          | Description                                                               | Default Value                  |
| ----------------------------- | ------------------------------------------------------------------------- | ------------------------------ |
| **CACHE_ENDPOINT**            | The URL of the cache endpoint                                             | `""`                           |
| CACHE_ENDPOINT_USERNAME       | The username for the cache endpoint                                       | `""`                           |
| CACHE_ENDPOINT_PASSWORD       | The password for the cache endpoint                                       | `""`                           |
| CACHE_DEFAULT_ENTRY_NAME      | The default entry name for the cache                                      | `"default"`                    |
| CACHE_TAG_HEADER              | The header name for the cache tag                                         | `"xkey"`                       |
| SUPPORT_URL_ENCODED           | Whether to clear the cache for the URL-encoded version of the dataset URI | `"true"`                       |
| **SPARQL_ENDPOINT_URL**       | The URL of the SPARQL endpoint                                            | `""`                           |
| SPARQL_USERNAME               | The username for the SPARQL endpoint                                      | `""`                           |
| SPARQL_PASSWORD               | The password for the SPARQL endpoint                                      | `""`                           |
| S3_ENABLED                    | Whether to use S3 for caching                                             | `"false"`                      |
| S3_LAST_TIMESTAMP_KEY         | The key for the last timestamp file in S3                                 | `"last_timestamp.txt"`         |
| S3_SIMPLE_DATE_WORKAROUND_KEY | The key for the simple date workaround file in S3                         | `"simple_date_workaround.txt"` |
| S3_BUCKET                     | The S3 bucket name                                                        | `"default"`                    |
| S3_ACCESS_KEY_ID              | The S3 access key ID                                                      | `""`                           |
| S3_SECRET_ACCESS_KEY          | The S3 secret access key                                                  | `""`                           |
| S3_REGION                     | The S3 region                                                             | `"default"`                    |
| S3_ENDPOINT                   | The S3 endpoint                                                           | `""`                           |
| S3_SSL_ENABLED                | Whether to use SSL for S3                                                 | `"false"`                      |
| S3_FORCE_PATH_STYLE           | Whether to force path style for S3                                        | `"false"`                      |

If `S3_ENABLED` is set to `true`, the first time you run the script you might see an error message saying that the last timestamp file does not exist. This is expected, and the script will create the file automatically at the end of the first run, and will update that file every time it runs.
You will not see this error message again after the first run.

You might also get a similar error about a simple date workaround file. This is also expected, and the script will create the file automatically at the end of the first run, and will update that file every time it runs.

Using S3 allows us to trick a bit for the cases where `dateModified` returned by the SPARQL query is a `date` and not a `dateTime`.
The trick makes sure that the cache is invalidated for this entry only the first time, and the day after the `dateModified` date.
Without this trick, the cache would be invalidated every time the script runs until the day after its value.

## Development

### Branching Strategy

- **develop**: Integration branch for features and fixes
- **main**: Production-ready code, triggers Docker builds

### Build Once, Deploy Many

Docker images are built **once** on main and promoted through environments by re-tagging:

```
main merge → 0.3.2-test → (promote) → 0.3.2-int → (promote) → 0.3.2-prod
```

Same image binary, different tags. No rebuilding between environments.

### CI/CD Workflows

| Workflow | Trigger | Description |
|----------|---------|-------------|
| CI | Push/PR to develop, main | Runs lint and security audit |
| Build and Push to TEST | Push to main | Builds image with `{version}-test` tag |
| Release | Push to main | Version bump via changesets |
| Promote to INT | Manual | Re-tags `{version}-test` → `{version}-int` |
| Promote to PROD | Manual | Re-tags `{version}-int` → `{version}-prod` (requires approval) |
| Rollback | Manual | Re-tags older version to `{env}-rollback` |

### Image Tags

| Tag Pattern | Environment | Example |
|-------------|-------------|---------|
| `{version}-test` | TEST | `0.3.2-test` |
| `{version}-int` | INT | `0.3.2-int` |
| `{version}-prod` | PROD | `0.3.2-prod` |
| `sha-{hash}` | Immutable reference | `sha-abc1234` |
| `main` | Latest main branch | `main` |

### Deployment Flow

1. Merge PR to `main`
2. Docker workflow builds and pushes `{version}-test`
3. Flux deploys TEST using `{version}-test` tag
4. After TEST validation, run **Promote to INT** workflow
5. Flux deploys INT using `{version}-int` tag
6. After INT validation, run **Promote to PROD** workflow (requires approval)
7. Flux deploys PROD using `{version}-prod` tag

### Rollback

1. Go to Actions > Rollback
2. Select environment (test/int/prod)
3. Enter version to rollback to (e.g., `0.3.1`)
4. Workflow re-tags that version as `{env}-rollback`
5. Update Flux to use `{env}-rollback` tag

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

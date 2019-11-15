# GitHub Action to publish new Sentry.io releases

Action wraps the [Sentry CLI](https://docs.sentry.io/cli/) to publish new releases on Sentry.io.

## Usage

An example workflow to release a new Sentry version:

```yml
on:
  push:
    branches:
      - master
      
name: Deployment

jobs:
  release-a-new-version:
    name: Release a new version

    runs-on: ubuntu-latest

    steps:
      - name: "Checkout"
        uses: actions/checkout@v1.1.0

      - name: "Send release to Sentry"
        uses: juankaram/sentry-release@v1.0.0
        env:
          SENTRY_AUTH_TOKEN: ${{ secrets.SENTRY_AUTH_TOKEN }}
          SENTRY_ORG: foo
          SENTRY_PROJECT: bar
          ENVIRONMENT: development
```

### Secrets

- `SENTRY_AUTH_TOKEN` - **Required**. The authentication token to use for all communication with Sentry. ([more info](https://docs.sentry.io/cli/configuration/))
- `SENTRY_ORG` - **Required**. The slug of the organization to use for a command.
- `SENTRY_PROJECT` - **Required**. The slug of the project to use for a command.

### Environment variables

- `RELEASE_VERSION` - **Optional**. Custom version tag. Defaults to `${SENTRY_PROJECT}@$(git describe --always --long)`.

## Attribution

Heavily inspired by [GitHub Actions](https://github.com/actions).

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

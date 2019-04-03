# GitHub Action to publish new Sentry.io releases

Action wraps the [Sentry CLI](https://docs.sentry.io/cli/) to publish new releases on Sentry.io.

## Usage

An example workflow to release a new Sentry version:

```hcl
workflow "Release a new version" {
  on = "push"
  resolves = "release version"
}

action "release version" {
  uses = "juankaram/sentry-release@master"
  secrets = ["SENTRY_AUTH_TOKEN"]
  env = {
    SENTRY_ORG     = "foo"
    SENTRY_PROJECT = "bar"
    ENVIRONMENT    = "development"
  }
}
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

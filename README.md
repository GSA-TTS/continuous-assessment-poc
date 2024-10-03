Continuous Monitoring
========================

<<TKTK: quick summary of project>>

## Development

If you're new to Rails, see the [Getting Started with Rails](https://guides.rubyonrails.org/getting_started.html)
guide for an introduction to the framework.

### Local Setup

* Install Ruby 3.3.4
* Install NodeJS 22.8.0
* Install homebrew dependencies: `brew bundle`
  * [redis](https://redis.io/)
  * [PostgreSQL](https://www.postgresql.org/)
  * [Dockerize](https://github.com/jwilder/dockerize)
  * [jq](https://stedolan.github.io/jq/)
  * [ADR Tools](https://github.com/npryce/adr-tools)
  * [Chromedriver](https://sites.google.com/chromium.org/driver/)
    * Chromedriver must be allowed to run. You can either do that by:
      * The command line: `xattr -d com.apple.quarantine $(which chromedriver)` (this is the only option if you are on Big Sur)
      * Manually: clicking "allow" when you run the integration tests for the first time and a dialogue opens up
* Install Ruby dependencies: `bundle install`
* Install JS dependencies: `yarn install`
* Create database and run migrations: `bundle exec rake db:setup`
* Run the server: `bin/dev`
* Visit the site: http://localhost:3000

### Local Configuration

Environment variables can be set in development using the [dotenv](https://github.com/bkeepers/dotenv) gem.

Consistent but sensitive credentials should be added to `config/credentials.yml.enc` by using `$ rails credentials:edit`

Production credentials should be added to `config/credentials/production.yml.enc` by using `$ rails credentials:edit --environment production`

Any changes to variables in `.env` that should not be checked into git should be set
in `.env.local`.

If you wish to override a config globally for the `test` Rails environment you can set it in `.env.test.local`.
However, any config that should be set on other machines should either go into `.env` or be explicitly set as part
of the test.

## Security

### Authentication

TBD

### Inline `<script>` and `<style>` security

The system's Content-Security-Policy header prevents `<script>` and `<style>` tags from working without further
configuration. Use `<%= javascript_tag nonce: true %>` for inline javascript.

See the [CSP compliant script tag helpers](./doc/adr/0004-rails-csp-compliant-script-tag-helpers.md) ADR for
more information on setting these up successfully.

## Internationalization

### Managing locale files

We use the gem `i18n-tasks` to manage locale files. Here are a few common tasks:

Add missing keys across locales:
```
$ i18n-tasks missing # shows missing keys
$ i18n-tasks add-missing # adds missing keys across locale files
```

Key sorting:
```
$ i18n-tasks normalize
```

Removing unused keys:
```
$ i18n-tasks unused # shows unused keys
$ i18n-tasks remove-unused # removes unused keys across locale files
```

For more information on usage and helpful rake tasks to manage locale files, see [the documentation](https://github.com/glebm/i18n-tasks#usage).

## Testing

### Running tests

* Tests: `bundle exec rake spec`
* Ruby linter: `bundle exec rake standard`
* Accessibility scan: `./bin/pa11y-scan`
* Dynamic security scan: `./bin/owasp-scan`
* Ruby static security scan: `bundle exec rake brakeman`
* Ruby dependency checks: `bundle exec rake bundler:audit`
* JS dependency checks: `bundle exec rake yarn:audit`

Run everything: `bundle exec rake`

#### Pa11y Scan

When new pages are added to the application, ensure they are added to `./pa11y.js` so that they can be scanned.

### Automatic linting and terraform formatting
To enable automatic ruby linting and terraform formatting on every `git commit` follow the instructions at the top of `.githooks/pre-commit`

## CI/CD

GitHub actions are used to run all tests and scans as part of pull requests.

Security scans are also run on a scheduled basis. Weekly for static code scans, and daily for dependency scans.

### Deployment

Each environment has dependencies on a PostgreSQL RDS instance managed by cloud.gov.
See [cloud.gov docs](https://cloud.gov/docs/services/relational-database/) for information on RDS.

#### Staging

Deploys to staging, including applying changes in terraform, happen
on every push to the `main` branch in GitHub.

The following secrets must be set within the `staging` [environment secrets](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-an-environment)
to enable a deploy to work:

| Secret Name | Description |
| ----------- | ----------- |
| `CF_USERNAME` | cloud.gov SpaceDeployer username |
| `CF_PASSWORD` | cloud.gov SpaceDeployer password |
| `RAILS_MASTER_KEY` | `config/master.key` |
| `TERRAFORM_STATE_ACCESS_KEY` | Access key for terraform state bucket |
| `TERRAFORM_STATE_SECRET_ACCESS_KEY` | Secret key for terraform state bucket |



#### Production

Deploys to production, including applying changes in terraform, happen
on every push to the `production` branch in GitHub.

The following secrets must be set within the `production` [environment secrets](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-an-environment)
to enable a deploy to work:

| Secret Name | Description |
| ----------- | ----------- |
| `CF_USERNAME` | cloud.gov SpaceDeployer username |
| `CF_PASSWORD` | cloud.gov SpaceDeployer password |
| `RAILS_MASTER_KEY` | `config/credentials/production.key` |
| `TERRAFORM_STATE_ACCESS_KEY` | Access key for terraform state bucket |
| `TERRAFORM_STATE_SECRET_ACCESS_KEY` | Secret key for terraform state bucket |



### Configuring ENV variables in cloud.gov

All configuration that needs to be added to the deployed application's ENV should be added to
the `env:` block in `manifest.yml`

Items that are both **public** and **consistent** across staging and production can be set directly there.

Otherwise, they are set as a `((variable))` within `manifest.yml` and the variable is defined depending on sensitivity:

#### Credentials and other Secrets

1. Store variables that must be secret using [GitHub Environment Secrets](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-an-environment)
1. Add the appropriate `--var` addition to the `cf_command` line on the deploy action like the existing `rails_master_key`

#### Non-secrets

Configuration that changes from staging to production, but is public, should be added to `config/deployment/staging.yml` and `config/deployment/production.yml`

### Public Egress Proxy

Traffic to be delivered to the public internet or s3 must be proxied through the [cg-egress-proxy](https://github.com/GSA-TTS/cg-egress-proxy) app.

To deploy the proxy manually:

1. Ensure terraform state is up to date.
1. Update the acl files in `config/deployment/egress_proxy`
1. Deploy the proxy to staging: `bin/ops/deploy_egress_proxy.rb -s rahearn -a continuous_monitoring-staging`
1. Deploy the proxy to production: `bin/ops/deploy_egress_proxy.rb -s rahearn -a continuous_monitoring-production`

See the [ruby troubleshooting doc](https://github.com/GSA-TTS/cg-egress-proxy/blob/main/docs/ruby.md) first if you have any problems making outbound connections through the proxy.
## Documentation

### Auditree Control Validation

Auditree is used within CI/CD to validate that certain controls are in place.

* Run `bin/auditree` to start the auditree CLI.
* Run `bin/auditree SCRIPT_NAME` to run a single auditree script

#### Initial auditree setup.

These steps must happen once per project.

1. Docker desktop must be running
1. Initialize the config file with `bin/auditree init > config/auditree.template.json`
1. Create an evidence locker repository with a default or blank README
1. Create a github personal access token to interact with the code repo and evidence locker and set as `AUDITREE_GITHUB_TOKEN` secret within your Github Actions secrets.
1. Update `config/auditree.template.json` with the repo addresses for your locker and code repos
1. Copy the `devtools_cloud_gov` component definition into the project with the latest docker-trestle

#### Ongoing use

See the [auditree-devtools README](https://github.com/gsa-tts/auditree-devtools) for help with updating
auditree and using new checks.

### Compliance Documentation

Security Controls should be documented within doc/compliance/oscal.

* Run `bin/trestle` to start the trestle CLI.
* Run `bin/trestle SCRIPT_NAME` to run a single trestle script

#### Initial trestle setup.

These steps must happen once per project.

1. Docker desktop must be running
1. Start the trestle cli with `bin/trestle`
1. Copy the `cloud_gov` component to the local workspace with `copy-component -n cloud_gov`
1. Generate the initial markdown with `generate-ssp-markdown`

#### Ongoing use

See the [docker-trestle README](https://github.com/gsa-tts/docker-trestle) for help with the workflow
for using those scripts for editing the SSP.

### Architectural Decision Records

Architectural Decision Records (ADR) are stored in `doc/adr`
To create a new ADR, first install [ADR-tools](https://github.com/npryce/adr-tools) if you don't
already have it installed.
* `brew bundle` or `brew install adr-tools`

Then create the ADR:
*  `adr new Title Of Architectural Decision`

This will create a new, numbered ADR in the `doc/adr` directory.

Compliance diagrams are stored in `doc/compliance`. See the README there for more information on
generating diagram updates.

## Contributing

*This will continue to evolve as the project moves forward.*

* Pull down the most recent main before checking out a branch
* Write your code
* If a big architectural decision was made, add an ADR
* Submit a PR
  * If you added functionality, please add tests.
  * All tests must pass!
* Ping the other engineers for a review.
* At least one approving review is required for merge.
* Rebase against main before merge to ensure your code is up-to-date!
* Merge after review.
  * Squash commits into meaningful chunks of work and ensure that your commit messages convey meaning.

## Story Acceptance

TBD

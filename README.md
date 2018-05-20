
# Gamelists
[![Coverage Status](https://coveralls.io/repos/github/ConnorRigby/safe-empty-bovine/badge.svg?branch=master)](https://coveralls.io/github/ConnorRigby/safe-empty-bovine?branch=master)
[![CircleCI](https://circleci.com/gh/ConnorRigby/safe-empty-bovine.svg?style=svg)](https://circleci.com/gh/ConnorRigby/safe-empty-bovine)

## Deployment
Deploys are handled by CircleCI. Heres what is required:

### Env vars
All these environment variables need to be set on circleci either via a `context`
or via the project settings.
* `GIGALIXIR_APP_NAME` - App name to be deployed.
* `GIGALIXIR_EMAIL` - URI encoded email for user with access to deployment
* `GIGALIXIR_API_KEY` - gigalixir api key.
* `COVERALLS_REPO_TOKEN` - for posting coverage to coveralls.

### Requirements for a deploy
To perform a deploy do:

    git push origin master

Then CircleCI will perform a number of tasks.

* `ExUnit` Tests
* `dialyzer` static code analysis
* `credo` static code analysis
* `mix format --check-formatted`

*If* those all pass, the deploy commences. :sparkles:

    git remote add gigalixir https://$GIGALIXIR_EMAIL:$GIGALIXIR_API_KEY@git.gigalixir.com/$GIGALIXIR_APP_NAME.git
    git push -f gigalixir HEAD:refs/heads/master

# serverless-aws-ruby-template

Custom template for the [Serverless Framework](https://github.com/serverless/serverless) for AWS Ruby projects.

The template comes configured with:

- [serverless-ruby-package](https://github.com/joshuaflanagan/serverless-ruby-package) plugin to package gem dependencies
- rspec with a stub unit test
- simplecov
- rubocop

## Setup

Initialize your project using this template

    # master is the most recent released version
    sls create --name my-project --template-url https://github.com/apsoto/serverless-aws-ruby-template/tree/master/template

Install Dependencies:

    cd ./my-project
    npm install
    bundle config set path --local 'vendor/bundle'
    bundle install --standalone

Setup binstub for vscode spec debugging

    bundle binstubs rspec-core

Confirm Setup

    bundle exec rake
    sls package

## VSCode Debugging

If you installed the rspec binstub as the setup instructions recommended, you can set break points and debug from within VSCode.

Open your project in VSCode, open the generated sample spec, and go to the 'Run | Start Debugging' menu.  You will see the rspec output in the Debug Console window.
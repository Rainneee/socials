# Socials

Socials is a personal project that is a mini-clone of Twitter. This project is solely for personal and learning purposes.


#### Requirements

You'll need the following installed to run the template successfully:

* Ruby 3.0 or higher
* Node.js v18
* bundler - `gem install bundler`
* Yarn - `npm install --global yarn` [Install Yarn](https://yarnpkg.com/en/docs/install)
* Foreman - `gem install foreman` - helps run all your processes in development

#### Initial Setup

First, no need to edit `config/database.yml` as this project made use of sqlite3 default when creating rails app.

Run `bin/setup` to install Rubygem and Javascript dependencies. This will also install `foreman` system wide for you and setup your database.

```bash
bin/setup
```

Additionally you may want to run, in order to test with available items

rails db:seed

#### Running Socials

To run your application, you'll use the `bin/dev` command:

```bash
bin/dev
```

This starts up Foreman running the Procfile.dev config.

#### Windows Support

If you'd like to run Socials Windows, it is recommended using WSL2. You can find instructions here: https://gorails.com/setup/windows


Notes:
This Side Project do have some features not yet finished

Following
Search
Notification
Trends
Tests




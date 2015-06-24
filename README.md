
# Sql Tutor

Sql tutor app

### Setup

Install gems:
```
$ bundle install
```

Default environment variables are stored in the `dotenv` file. You should create both `.env.development` and `.env.test` files with your local configuration details.

```
$ cp dotenv .env.development
$ cp dotenv .env.test
```

Create and seed the database:
```
$ rake db:setup
```

Setup pow using powder
```
$ powder install
$ powder link
```

Your app should start and be accessible at `http://launchpad.devbootcamp.dev`. You can restart the server with the command `$ powder restart`.

### Development

See a list of powder commands:
```
$ powder -h
```

Run tests:
```
$ RAILS_ENV=test rake spec
```

See the [wiki](https://github.com/devbootcamp-tech/wiki/wiki) for Git and deployment instructions.


### Scheduled jobs

No scheduled jobs

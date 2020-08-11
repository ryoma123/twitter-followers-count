# twitter-followers-count

Get the count of followers from the Twitter URLs.

## Installation

```sh
$ bundle install
```

## Usage

Write Twitter URLs in `urls.csv`:

```
https://twitter.com/twitterjp
https://twitter.com/twitterdevjp
```

Copy `.env.sample` to `.env` and fill it out:

```
TWITTER_CONSUMER_KEY=
TWITTER_CONSUMER_SECRET=
```

When executed, it is output to the `./output` directory:

```sh
$ bundle exec exe/twitter-followers-count
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

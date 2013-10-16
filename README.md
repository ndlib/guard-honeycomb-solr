# Guard::Jetty

Guard::Jetty automatically starts and reloads your jetty server.

## Installation

Please make sure to have [Guard][guard] installed before continuing.

Add it to your Gemfile

```ruby
group :development do
  gem 'guard-jetty'
end
```

then install it by running Bundler:

```bash
$ bundle
```

Add the default Guard::Jetty template to your `Guardfile` by running:

```bash
$ guard init jetty
```

## Usage

Guard::Jetty uses [Jettywrapper][jettywrapper] to start and stop Jetty.  By default it will read your jetty configuration from `config/jetty.yml`, but you can also set options in your Guardfile.  Options set in the Guardfile will override those found in `config/jetty.yml`.

```ruby
guard 'jetty', jetty_port: 8983 do
  watch('config/jetty.yml')
  watch(%r{^jetty/(.+)\.xml$})
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

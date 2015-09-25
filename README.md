# Guard::HoneycombSolr

Guard::HoneycombSolr automatically starts and reloads your honeycomb solr server.

## Installation

Please make sure to have [Guard](https://github.com/guard/guard) installed before continuing.

Add it to your Gemfile

```ruby
group :development do
  gem 'guard-honeycomb_solr'
end
```

then install it by running Bundler:

```bash
$ bundle
```

Add the default Guard::HoneycombSolr template to your `Guardfile` by running:

```bash
$ guard init honeycomb_solr
```

## Usage

Please read the [Guard usage doc](https://github.com/guard/guard#readme).

Guard::HoneycombSolr uses [HoneycombSolr](https://github.com/ndlib/honeycomb_solr) to start and stop HoneycombSolr.  It will read your solr configuration from `config/solr.yml`..

```ruby
guard 'honeycomb_solr' do
  watch('config/solr.yml')
  watch(%r{^solr/(.+)\.(xml|json|properties|txt)$})
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

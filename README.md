# Bridgetown Minify HTML

_Note: This is prerelease & is still being developed_

A Bridgetown plugin to Minify your outputted HTML.

## Installation

Run this command to add this plugin to your site's Gemfile:

```shell
$ bundle add bridgetown-minify-html -g bridgetown_plugins
```

## Usage

The plugin will compress your HTML when your site is built.

### Optional configuration options

Within your `bridgetown.config.yml` file, you have the options:

```
minify_html:
  enabled: true
```

## Testing

* Run `bundle exec rspec` to run the test suite
* Or run `script/cibuild` to validate with Rubocop and test with rspec together.

## Contributing

1. Fork it (https://github.com/MikeRogers0/bridgetown-minify-html/fork)
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b feature/my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

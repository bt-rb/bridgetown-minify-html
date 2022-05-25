<h1 align="center">
  Bridgetown Minify HTML
</h1>

<p align="center">
  <a target="_blank" rel="noopener noreferrer" href="https://badge.fury.io/rb/bridgetown-minify-html">
    <img src="https://badge.fury.io/rb/bridgetown-minify-html.svg" alt="Gem Version" style="max-width:100%;">
  </a>
  <a target="_blank" rel="noopener noreferrer" href="https://github.com/bt-rb/bridgetown-minify-html/workflows/RSpec/badge.svg">
    <img src="https://github.com/bt-rb/bridgetown-minify-html/workflows/RSpec/badge.svg" alt="RSpec" style="max-width:100%;">
  </a>
  <a target="_blank" rel="noopener noreferrer" href="https://github.com/bt-rb/bridgetown-minify-html/workflows/RuboCop/badge.svg">
    <img src="https://github.com/bt-rb/bridgetown-minify-html/workflows/RuboCop/badge.svg" alt="RuboCop" style="max-width:100%;">
  </a>
</p>

<p align="center">
  A Bridgetown plugin to Minify your outputted HTML.
</p>

## Installation

Run this command to add this plugin to your site's Gemfile:

```shell
bundle add bridgetown-minify-html -g bridgetown_plugins
```

## Usage

Once you've added the plugin, it'll automatically compress your outputted HTML without any additional configuration required when you run `bin/bridgetown build` or `bin/bridgetown deploy`.

### Optional configuration options

Within your `bridgetown.config.yml` file, you have the options:

```yml
minify_html:
  enabled: true
  remove_spaces_inside_tags: true
  remove_multi_spaces: true
  remove_comments: true
  remove_intertag_spaces: false
  remove_quotes: false
  simple_doctype: false
  remove_script_attributes: false
  remove_style_attributes: false
  remove_link_attributes: false
  remove_form_attributes: false
  remove_input_attributes: false
  remove_javascript_protocol: false
  remove_http_protocol: false
  remove_https_protocol: false
  preserve_line_breaks: false
  simple_boolean_attributes: false
  compress_js_templates: false
```

## Testing

* Run `bundle exec rspec` to run the test suite
* Or run `script/cibuild` to validate with Rubocop and test with rspec together.

## Contributing

1. Fork it (https://github.com/bt-rb/bridgetown-minify-html/fork)
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b feature/my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

## 💌 In Loving Memory of Mike Rogers

[Mike Rogers](https://github.com/MikeRogers0) was the creator of `bridgetown-minify-html` and participated in the project from July 2020 until his passing in November 2021. This project is maintained by [@andrewmcodes](https://github.com/andrewmcodes) in his honor. You can find Mike's obituary [here if you'd like to leave a message.](https://www.mykeeper.com/profile/MikeRogers/)

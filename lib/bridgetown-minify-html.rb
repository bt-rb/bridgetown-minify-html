# frozen_string_literal: true

require "bridgetown"
require "htmlcompressor"
require "bridgetown-minify-html/builder"
require "bridgetown-minify-html/minifier"

Bridgetown.initializer :"bridgetown-minify-html" do |config|
  config.builder BridgetownMinifyHtml::Builder
end

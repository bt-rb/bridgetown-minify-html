# frozen_string_literal: true

require "bridgetown"
require 'htmlcompressor'
require "bridgetown-minify-html/builder"

Bridgetown::PluginManager.new_source_manifest(
  origin: BridgetownMinifyHtml
)

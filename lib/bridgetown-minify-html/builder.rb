# frozen_string_literal: true

# This add the hook for when the site has been built & is ready for compression.
module BridgetownMinifyHtml
  class Builder < Bridgetown::Builder
    def build
      return if config[:watch]

      hook :site, :post_render, priority: :low do |site|
        BridgetownMinifyHtml::Minifier.new(site).call!
      end
    end
  end
end

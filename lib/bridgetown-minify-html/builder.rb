# frozen_string_literal: true

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

BridgetownMinifyHtml::Builder.register

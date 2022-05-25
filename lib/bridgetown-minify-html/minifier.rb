# frozen_string_literal: true

# This actually does the Minification. It gets passed the site object,
# then it'll just loop through all the resources.
module BridgetownMinifyHtml
  class Minifier
    DEFAULT_OPTIONS = {
      enabled: true,
      remove_spaces_inside_tags: true,
      remove_multi_spaces: true,
      remove_comments: true,
      remove_intertag_spaces: false,
      remove_quotes: false,
      simple_doctype: false,
      remove_script_attributes: false,
      remove_style_attributes: false,
      remove_link_attributes: false,
      remove_form_attributes: false,
      remove_input_attributes: false,
      remove_javascript_protocol: false,
      remove_http_protocol: false,
      remove_https_protocol: false,
      preserve_line_breaks: false,
      simple_boolean_attributes: false,
      compress_js_templates: false,
    }.freeze

    def initialize(site)
      @site = site
      @minified_count = 0
    end

    def call!
      @site.resources.each do |resource|
        minify_resource(resource)
      end

      Bridgetown.logger.info "Minify HTML:", "Complete, Processed #{@minified_count} file(s)"
    end

    private

    def minify_resource(resource)
      return unless compressible?(resource)

      resource.output = compressor.compress(resource.output)
      @minified_count += 1
    end

    def compressible?(resource)
      resource.destination.respond_to?(:output_ext) && [".html", ".svg", ".xml"].include?(resource.destination.output_ext)
    end

    def compressor
      @compressor ||= HtmlCompressor::Compressor.new(options)
    end

    def options
      @options ||= DEFAULT_OPTIONS.merge(options_overrides)
    end

    def options_overrides
      @options_overrides ||= (@site.config["minify_html"] || {})
        .each_with_object({}) { |(k, v), new_config| new_config[k.to_sym] = v; }
        .compact
    end
  end
end

# frozen_string_literal: true
#
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
      @minified_count = 0;
    end

    def call!
      (@site.pages + @site.documents).each do |page|
        minify_page(page)
      end

      Bridgetown.logger.info "Minify HTML:", "Complete, Processed #{@minified_count} file(s)"
    end

    private

    def minify_page(page)
      return unless compressible?(page.output_ext)

      page.output = compressor.compress(page.output)
      @minified_count += 1
    end

    def compressible?(extension)
      [".html", ".svg", ".xml"].include?(extension)
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

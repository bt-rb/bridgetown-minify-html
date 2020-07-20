# frozen_string_literal: true

require "spec_helper"

describe(BridgetownMinifyHtml) do
  let(:overrides) { {} }
  let(:config) do
    Bridgetown.configuration(Bridgetown::Utils.deep_merge_hashes({
      "full_rebuild" => true,
      "root_dir"     => root_dir,
      "source"       => source_dir,
      "destination"  => dest_dir,
    }, overrides))
  end

  let(:site) { Bridgetown::Site.new(config) }
  let(:page_contents) { File.read(dest_dir("index.html")) }
  let(:post_contents) { File.read(dest_dir("2020/07/20/sample.html")) }
  before(:each) do
    site.process
  end

  it "outputs HTML without any linebreaks" do
    expect(page_contents).to_not match "\n"
    expect(post_contents).to_not match "\n"
  end

  context 'When minify_html.enabled false' do
    let(:overrides) do
      {
        "minify_html" => {
          "enabled" => false
        }
      }
    end

    it "outputs HTML with linebreaks" do
      expect(page_contents).to match "\n"
      expect(post_contents).to match "\n"
    end
  end
end

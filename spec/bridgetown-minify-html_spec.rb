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
  let(:contents) { File.read(dest_dir("index.html")) }
  before(:each) do
    site.process
  end

  it "outputs HTML without any linebreaks" do
    expect(contents).to_not match "\n"
  end

  context 'When disabled' do
    let(:overrides) do
      {
        "minify_html" => {
          "enabled" => false
        }
      }
    end

    it "outputs HTML with any linebreaks" do
      expect(contents).to match "\n"
    end
  end
end

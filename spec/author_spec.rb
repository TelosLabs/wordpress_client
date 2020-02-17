require "spec_helper"

module WordpressClient
  describe Author do
    let(:fixture) { json_fixture("author.json") }

    it "can be parsed from JSON data" do
      author = Author.parse(fixture)

      expect(author.id).to eq 23
      expect(author.name).to eq "Test User"
      expect(author.description).to eq "I am a happy person."
      expect(author.slug).to eq "test"

    end
  end
end

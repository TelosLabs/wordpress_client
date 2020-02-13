require "spec_helper"

module WordpressClient
  module Plugins
    module RelatedPostsByTaxonomy
      describe RelatedPost do
        let(:fixture) { json_fixture("recommended-posts.json") }

        it "can be parsed from JSON data" do
          related_posts = RelatedPost.parse(fixture)

          expect(related_posts.post_id).to eq 1
          expect(related_posts.related_post_ids).to eq [
            "2",
            "3",
            "4",
          ]
        end
      end
    end
  end
end

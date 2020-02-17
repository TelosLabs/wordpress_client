module WordpressClient
  module Plugins
    module RelatedPostsByTaxonomy
      class RelatedPost
        attr_reader :post_id, :related_post_ids

        # @api private
        #
        # Parses a data structure from a WP API response body into this term type.
        def self.parse(data)
          new(
            post_id: data.fetch("post_id"),
            related_post_ids: data.fetch("posts"),
          )
        end

        def initialize(post_id:, related_post_ids:)
          @post_id = post_id
          @related_post_ids = related_post_ids
        end

        def ==(other)
          if other.is_a? RelatedPost
            other.class == self.class &&
              other.post_id == post_id &&
              other.related_post_ids == related_post_ids 
          else
            super
          end
        end

        # Shows a nice representation of the RelatedPost type.
        def inspect
          "#<#{self.class} ##{post_id}>"
        end
      end
    end
  end
end

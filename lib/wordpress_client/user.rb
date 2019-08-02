module WordpressClient
  # Represents a user from Wordpress.
  # @see https://developer.wordpress.org/rest-api/reference/users/ API documentation for User
  class User
    attr_accessor(
      :id, :name, :description, :slug, :avatar_urls
    )

    def self.parse(data)
      new(
        id: data.fetch("id"),
        name: data.fetch("name"),
        description: data.fetch("description"),
        slug: data.fetch("slug"),
        avatar_urls: data.fetch("avatar_urls")
      )
    end

    def initialize(id:, name:, description:, slug:, avatar_urls:)
      @id = id
      @name = name
      @description = description
      @slug = slug 
      @avatar_urls = avatar_urls
    end

    # @api private
    # Compares another instance. All attributes in this list must be equal for
    # the instances to be equal:
    #
    # * +id+
    # * +name+
    # * +description+
    # * +slug+
    # * +avatar_urls+
    #
    # One must also not be a subclass of the other; they must be the exact same class.
    def ==(other)
      if other.is_a? User
        other.class == self.class &&
          other.id == id &&
          other.name == name &&
          other.description == description &&
          other.slug == slug &&
          other.avatar_urls == avatar_urls
      else
        super
      end
    end

    # Shows a nice representation of the term type.
    def inspect
      "#<#{self.class} ##{id} #{name} (#{slug})>"
    end

  end
end

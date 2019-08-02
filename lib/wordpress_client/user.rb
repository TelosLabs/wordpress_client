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

  end
end

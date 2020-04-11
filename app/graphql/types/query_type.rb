module Types
  class QueryType < Types::BaseObject
    field :get_image, resolver: Queries::GetImage, description: 'Get a image by id'
    field :images, resolver: Queries::Images, description: 'Get all images'
    field :hash_tags, resolver: Queries::HashTags, description: 'Get all hashtags'
    field :people, resolver: Queries::People, description: 'Get all people'
    field :search_images, resolver: Queries::SearchImages, description: 'Search images'
  end
end
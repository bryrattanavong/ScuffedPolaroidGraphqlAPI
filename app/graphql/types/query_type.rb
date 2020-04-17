module Types
  class QueryType < Types::BaseObject
    field :get_image, resolver: Queries::GetImage, description: 'Get a image by id'
    field :images, resolver: Queries::SearchImages, description: 'Get all images'
    field :hash_tags, resolver: Queries::HashTags, description: 'Get all hashtags'
    field :people, resolver: Queries::People, description: 'Get all people'
  end
end
module Types
  class QueryType < Types::BaseObject
    field :get_image, resolver: Queries::GetImage, description: 'Get a image by id'
    field :images, resolver: Queries::Images, description: 'Get all images'
  end
end
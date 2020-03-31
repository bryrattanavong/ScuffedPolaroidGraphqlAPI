module Types
    class ImageType < Types::BaseObject
        field :id, ID, null: false
        field :image_url, String, null: false
        field :description, String, null: true
        field :hash_tags,[HashTagType], null:true
        field :people,[PersonType], null:true
        field :posted_by, UserType, null: true, method: :user
    end
end
  
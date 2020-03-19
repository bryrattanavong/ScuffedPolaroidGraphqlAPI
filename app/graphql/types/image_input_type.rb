module Types
    InputObjects::ImageInputType = GraphQL::InputObjectType.define do
        name 'ImageInput'
        description 'Image added by user'
       
        input_field :image_name, String 
        input_field :image, Scalars::FileType
      end
end
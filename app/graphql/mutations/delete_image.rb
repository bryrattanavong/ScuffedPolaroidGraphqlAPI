module Mutations
    class DeleteImage < BaseMutation
        argument :id, ID, required: true

        field :image, Types::ImageType, null: false
        field :errors, [String], null: false
        
        def resolve(id:)
            image = Image.find(id)
            image.destroy
            {
              image: image,
              errors: []
            }
        end
    end
end
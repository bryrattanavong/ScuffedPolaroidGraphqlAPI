module Mutations
    class CreateImage < BaseMutation
        argument :image, ApolloUploadServer::Upload, required: true
        argument :description, String, required: false

        type Types::ImageType

        def resolve(params)
            Image.create!(
                user: context[:current_user],
                params
            )
        end
    end
end 
module Mutations
    class CreateImage < BaseMutation
      argument :image, Types::FileType, required: true
      argument :image_name, String, required: true
      argument :description, String, required: false
    
      type Types::ImageType
  
      def resolve(image:nil, image_name:nil, description:nil)
       user = context[:current_user]
       Image.create!(
         image: image,
         image_name: image_name,
         description: description,
         user: user
      )
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end 
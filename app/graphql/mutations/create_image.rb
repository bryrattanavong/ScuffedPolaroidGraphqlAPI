module Mutations
    class CreateImage < BaseMutation
      argument :image, Types::FileType, required: true
      argument :description, String, required: false
    
      type Types::ImageType
  
      def resolve(image:, description:)
       user = context[:current_user]
       Image.create!(
         image: image,
         description: description,
         user: user
      )
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end 
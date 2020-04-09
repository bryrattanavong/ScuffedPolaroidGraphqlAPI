module Mutations
  class CreateImage < BaseMutation
    argument :image, Types::FileType, required: true
    argument :description, String, required: false
    argument :people, [String], required: false
  
    type Types::ImageType

    def resolve(image:, description: nil, people: nil)
      authorized_user
      image = Image.create(
        image: image,
        description: description,
        user: context[:current_user]
      )
      raise GraphQL::ExecutionError, image.errors.full_messages.join(", ") unless image.errors.empty?
      if image.present?
        description.to_s.scan(/#\w+/).map{|tag| tag.gsub("#", "")}.each do |tag|
          hash_tag = HashTag.find_by(name: tag)
          if hash_tag.nil?
            hash_tag = HashTag.create(
              name: tag
            )
          end
          image_hashtag = ImageHashTag.create(
            image_id: image.id,
            hash_tag_id: hash_tag.id
          )
          raise GraphQL::ExecutionError, image_hashtag.errors.full_messages.join(", ") unless image_hashtag.errors.empty?   
        end
        if people
          people.each do |person_name|
            person = Person.find_by(name: person_name)
            if person.nil?
              person = Person.create(
                name: person_name
              )
            end
            image_person = ImagePerson.create(
              image_id: image.id,
              person_id: person.id
            )
            raise GraphQL::ExecutionError, image_person.errors.full_messages.join(", ") unless image_person.errors.empty?
          end
        end   
      end
    image
    end
  end
end 
module Queries
  class Images < BaseQuery
    type Types::ImageType.connection_type, null: false

    argument :title, String, required: false

    def resolve(title: nil)
      if title.present?
        Image.where('title LIKE ?', "%#{title}%")
      else
        Image.all
      end
    end
  end
end
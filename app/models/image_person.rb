class ImagePerson < ApplicationRecord
    belongs_to :image
    belongs_to :person
end

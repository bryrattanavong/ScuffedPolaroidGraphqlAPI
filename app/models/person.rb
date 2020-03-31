class Person < ApplicationRecord
    has_many :image_person
    has_many :images, through: :image_people
end

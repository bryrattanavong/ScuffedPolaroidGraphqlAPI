class User < ApplicationRecord
    has_secure_password
    has_many :image, dependent: :destroy
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true
end

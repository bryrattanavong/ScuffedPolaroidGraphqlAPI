include Rails.application.routes.url_helpers
class Image < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :image_hash_tags
  has_many :hash_tags, through: :image_hash_tags
  has_many :image_people
  has_many :people, through: :image_people

  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  def image_url
    Rails.cache.fetch([cache_key, __method__]) do
      Rails.application.routes.url_helpers.rails_blob_url(image)
    end 
  end
end

class CreateImagePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :image_people do |t|
      t.belongs_to :image, index: true
      t.belongs_to :person, index: true

      t.timestamps
    end
  end
end

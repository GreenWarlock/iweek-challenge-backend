class CreateBusinessPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :business_photos do |t|
      t.references :business, null: false, foreign_key: true
      t.string :photo_url
      t.boolean :active

      t.timestamps
    end
  end
end

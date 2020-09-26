class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.string :information
      t.string :latitude
      t.string :longitude
      t.boolean :cm_certification
      t.float :ratings
      t.boolean :active

      t.timestamps
    end
  end
end

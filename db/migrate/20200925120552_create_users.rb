class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :second_last_name
      t.string :email
      t.string :phone_number
      t.string :photo
      t.integer :level
      t.integer :exp
      t.boolean :active

      t.timestamps
    end
  end
end

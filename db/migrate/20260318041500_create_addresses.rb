class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :country
      t.string :province
      t.string :city
      t.string :district
      t.text :detail_address
      t.string :contact_name
      t.string :phone
      t.string :alt_phone
      t.string :email

      t.timestamps
    end
  end
end

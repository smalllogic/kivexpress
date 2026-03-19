class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sender_address, null: false, foreign_key: { to_table: :addresses }
      t.references :receiver_address, null: false, foreign_key: { to_table: :addresses }
      t.decimal :weight
      t.decimal :volume
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.string :status

      t.timestamps
    end
  end
end

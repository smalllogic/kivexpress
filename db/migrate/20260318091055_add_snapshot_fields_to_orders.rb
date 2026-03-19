class AddSnapshotFieldsToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :sender_name, :string
    add_column :orders, :sender_phone, :string
    add_column :orders, :sender_alt_phone, :string
    add_column :orders, :sender_email, :string
    add_column :orders, :sender_country, :string
    add_column :orders, :sender_province, :string
    add_column :orders, :sender_city, :string
    add_column :orders, :sender_district, :string
    add_column :orders, :sender_detail_address, :text
    add_column :orders, :receiver_name, :string
    add_column :orders, :receiver_phone, :string
    add_column :orders, :receiver_alt_phone, :string
    add_column :orders, :receiver_email, :string
    add_column :orders, :receiver_country, :string
    add_column :orders, :receiver_province, :string
    add_column :orders, :receiver_city, :string
    add_column :orders, :receiver_district, :string
    add_column :orders, :receiver_detail_address, :text
  end
end

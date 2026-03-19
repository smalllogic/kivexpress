class RemoveAddressIdsFromOrders < ActiveRecord::Migration[8.0]
  def change
    remove_column :orders, :sender_address_id, :integer
    remove_column :orders, :receiver_address_id, :integer
  end
end

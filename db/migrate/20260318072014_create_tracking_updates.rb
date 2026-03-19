class CreateTrackingUpdates < ActiveRecord::Migration[8.0]
  def change
    create_table :tracking_updates do |t|
      t.references :order, null: false, foreign_key: true
      t.string :status_description
      t.string :location

      t.timestamps
    end
  end
end

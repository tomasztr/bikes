class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :bike_id
      t.integer :time
      t.timestamps
    end
  end
end

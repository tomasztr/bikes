class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :brand
      t.integer :status
      t.integer :size
      
      t.timestamps
    end
  end
end

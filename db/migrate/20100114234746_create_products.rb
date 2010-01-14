class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :quantity
      t.decimal :price
      t.text :description
      t.boolean :available

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end

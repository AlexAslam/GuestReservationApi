class CreateRestaurantTables < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_tables do |t|
      t.references :restaurant, foreign_key: true
      t.string :name, :default => ""
      t.integer :min_guest, :default => 0
      t.integer :max_guest, :default => 0

      t.timestamps
    end
  end
end

class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name, :default => ""
      t.string :email, :default => ""
      t.string :phone, :default => ""

      t.timestamps
    end
  end
end

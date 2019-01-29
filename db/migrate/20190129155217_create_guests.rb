class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name, :default => ""
      t.string :email, :default => ""

      t.timestamps
    end
  end
end

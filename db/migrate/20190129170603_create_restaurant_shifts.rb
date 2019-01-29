class CreateRestaurantShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_shifts do |t|
      t.string :shift_type, :default => ""
      t.datetime :start_time, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :end_time, default: -> { 'CURRENT_TIMESTAMP' }
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end

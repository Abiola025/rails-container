class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.text :comment
      t.date :date_from
      t.date :date_to
      t.decimal :price
      t.boolean :accept, defualt: false
      t.boolean :decline, defualt: false
      t.references :container, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

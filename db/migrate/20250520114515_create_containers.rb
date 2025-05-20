class CreateContainers < ActiveRecord::Migration[7.1]
  def change
    create_table :containers do |t|
      t.string :name
      t.text :detail
      t.decimal :width
      t.decimal :height
      t.decimal :length
      t.decimal :maximum_weight
      t.decimal :empty_weight
      t.decimal :daily_price
      t.references :user, null: false, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end

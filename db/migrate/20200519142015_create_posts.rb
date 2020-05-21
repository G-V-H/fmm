class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :product, foreign_key: true
      t.integer :price_per_unit
      t.integer :units_available
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end

class ChangePriceToMoney < ActiveRecord::Migration[5.2]
  def self.up
    change_column :posts, :price_per_unit, :money
  end

  def self.down
    change_column :posts, :price_per_unit, :integer
  end
end

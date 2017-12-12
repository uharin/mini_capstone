class AddInStockAttributeToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :in_stock, :integer
  end
end

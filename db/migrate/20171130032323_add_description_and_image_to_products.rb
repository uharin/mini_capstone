class AddDescriptionAndImageToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :description, :string
    add_column :products, :image, :string
  end
end

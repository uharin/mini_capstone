class ChangeDataTypeOfDescriptionToText < ActiveRecord::Migration[5.1]

  # • Your description attribute may currently use the wrong data-type(string). Update it with the correct one if needed.
# • Update the price attribute with the correct data-type. Be mindful of the correct number digits your type of products require.

  def change
    change_column :products, :description, :text
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 9, scale: 2
  end
end

class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :location
      t.string :phone

      t.timestamps
    end
  end
end

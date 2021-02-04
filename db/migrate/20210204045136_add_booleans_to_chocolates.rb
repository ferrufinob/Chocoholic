class AddBooleansToChocolates < ActiveRecord::Migration[6.0]
  def change
    add_column :chocolates, :dairy_free, :boolean
    add_column :chocolates, :nut_free, :boolean
  end
end

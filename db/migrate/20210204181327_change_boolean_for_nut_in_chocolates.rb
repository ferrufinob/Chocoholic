class ChangeBooleanForNutInChocolates < ActiveRecord::Migration[6.0]
  def change
    change_column :chocolates, :nut_free, :boolean, default: false
  end
end

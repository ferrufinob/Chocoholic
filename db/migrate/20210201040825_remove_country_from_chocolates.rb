class RemoveCountryFromChocolates < ActiveRecord::Migration[6.0]
  def change
    remove_column :chocolates, :country
  end
end

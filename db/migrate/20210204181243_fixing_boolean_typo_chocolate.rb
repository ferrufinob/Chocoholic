class FixingBooleanTypoChocolate < ActiveRecord::Migration[6.0]
  def change
    change_column :chocolates, :dairy_free, :boolean, default: false
  end
end

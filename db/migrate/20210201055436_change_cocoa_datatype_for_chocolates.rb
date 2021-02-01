class ChangeCocoaDatatypeForChocolates < ActiveRecord::Migration[6.0]
  def change
    change_column :chocolates, :cocoa, :integer
  end
end

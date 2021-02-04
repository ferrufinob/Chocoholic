class RemoveCocoaAndRatingFromChocolates < ActiveRecord::Migration[6.0]
  def change
    remove_column :chocolates, :cocoa
    remove_column :chocolates, :rating
  end
end

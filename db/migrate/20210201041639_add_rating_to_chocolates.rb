class AddRatingToChocolates < ActiveRecord::Migration[6.0]
  def change
    add_column :chocolates, :rating, :integer
  end
end

class CreateChocolates < ActiveRecord::Migration[6.0]
  def change
    create_table :chocolates do |t|
      t.string :brand
      t.string :flavor
      t.string :country
      t.text :note
      t.string :cocoa
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

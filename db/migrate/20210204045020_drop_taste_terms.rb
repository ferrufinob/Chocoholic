class DropTasteTerms < ActiveRecord::Migration[6.0]
  def change
    drop_table :tasting_terms do |t|
      t.string :term
      t.timestamps
    end
  end
end

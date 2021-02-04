class DropTastingTerms < ActiveRecord::Migration[6.0]
  def change
    drop_table :chocolate_tasting_terms do |t|
      t.belongs_to :tasting_term, null: false, foreign_key: true
      t.belongs_to :chocolate, null: false, foreign_key: true
    end
  end
end

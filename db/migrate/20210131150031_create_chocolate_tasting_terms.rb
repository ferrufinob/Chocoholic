class CreateChocolateTastingTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :chocolate_tasting_terms do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :chocolate

      t.timestamps
    end
  end
end

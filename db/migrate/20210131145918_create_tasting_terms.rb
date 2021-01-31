class CreateTastingTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :tasting_terms do |t|
      t.string :term

      t.timestamps
    end
  end
end

class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.string :url
      t.references :batting, index: true, foreign_key: true
      t.references :bowling, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

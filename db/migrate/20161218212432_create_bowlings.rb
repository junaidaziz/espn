class CreateBowlings < ActiveRecord::Migration
  def change
    create_table :bowlings do |t|
      t.string :name
      t.float :overs
      t.integer :maidens
      t.integer :runs
      t.integer :wickets
      t.float :economy
      t.references :scorecard, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

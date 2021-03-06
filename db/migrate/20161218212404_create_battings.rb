class CreateBattings < ActiveRecord::Migration
  def change
    create_table :battings do |t|
      t.string :name
      t.string :status
      t.integer :runs
      t.integer :balls
      t.integer :fours
      t.integer :sixes
      t.float :strik_rake
      t.references :scorecard, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class AddBattingNoToBattings < ActiveRecord::Migration
  def change
    add_column :battings, :batting_no, :integer
  end
end

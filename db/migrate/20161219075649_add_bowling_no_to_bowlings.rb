class AddBowlingNoToBowlings < ActiveRecord::Migration
  def change
    add_column :bowlings, :bowling_no, :integer
  end
end

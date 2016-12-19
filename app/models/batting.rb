class Batting < ActiveRecord::Base
  belongs_to :scorecard
  scope :first_inning, -> {where(batting_no: 1)}
  scope :second_inning, -> {where(batting_no: 2)}
end

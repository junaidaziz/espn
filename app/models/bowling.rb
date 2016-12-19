class Bowling < ActiveRecord::Base
  belongs_to :scorecard
  scope :first_inning, -> {where(bowling_no: 1)}
  scope :second_inning, -> {where(bowling_no: 2)}

end

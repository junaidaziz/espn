class Scorecard < ActiveRecord::Base
  belongs_to :batting
  belongs_to :bowling
end

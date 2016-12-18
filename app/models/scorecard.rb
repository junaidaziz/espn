class Scorecard < ActiveRecord::Base
	has_many :battings, dependent: :destroy
	has_many :bowlings, dependent: :destroy
	validates :url, presence: true
	validates :url, :format => URI::regexp(%w(http https))
	after_create :build_batting

	private
		def build_batting
			page_data = Crawlar.new(self.url)
			page_data.get_batting_card.each do |batsman|
				self.battings.create!( name: batsman[0], status: batsman[1], runs: batsman[2], balls: batsman[3], fours: batsman[4], sixes: batsman[5],strik_rake: batsman[6])
			end
		end
end

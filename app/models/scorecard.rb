class Scorecard < ActiveRecord::Base
	has_many :battings, dependent: :destroy
	has_many :bowlings, dependent: :destroy
	validates :url, presence: true
	validates :url, :format => URI::regexp(%w(http https))
	after_create :build_battings
	after_create :build_bowlings
	private
		def build_battings
			page_data = Crawlar.new(self.url)
			page_data.get_batting_card.each do |batsman|
				self.battings.create!( name: batsman[0], status: batsman[1], runs: batsman[2], 
														 	 balls: batsman[3], fours: batsman[4], sixes: batsman[5],
														 	 strik_rake: batsman[6], batting_no: 1)
			end
			page_data.get_second_batting_card.each do |batsman|
				self.battings.create!( name: batsman[0], status: batsman[1], runs: batsman[2], 
														 	 balls: batsman[3], fours: batsman[4], sixes: batsman[5],
														 	 strik_rake: batsman[6], batting_no: 2)
			end
		end

		def build_bowlings
			page_data = Crawlar.new(self.url)
			page_data.get_first_bowling.each do |bowlar|
				self.bowlings.create!( name: bowlar[0], overs: bowlar[1], maidens: bowlar[2], 
														 	 runs: bowlar[3], wickets: bowlar[4], economy: bowlar[5],
															 bowling_no: 1
															)
			end

			page_data.get_second_bowling.each do |bowlar|
				self.bowlings.create!( name: bowlar[0], overs: bowlar[1], maidens: bowlar[2], 
														 	 runs: bowlar[3], wickets: bowlar[4], economy: bowlar[5],
															 bowling_no: 2
															)
			end

		end
end

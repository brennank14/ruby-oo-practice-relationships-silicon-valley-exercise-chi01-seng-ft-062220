require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end



start1 = Startup.new("Twitter", "Sarah", "Social Media")
start2 = Startup.new("Facebook", "Kathleen", "Social Media")
start3 = Startup.new("Instagram", "Sam", "Pictures")

cap1 = VentureCapitalist.new("Ryan", 1000000000000000)
cap2 = VentureCapitalist.new("Don", 17)

fund1 = FundingRound.new("seed", 20, start1, cap2)
fund2 = FundingRound.new("Series A", 400, start1, cap2)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line
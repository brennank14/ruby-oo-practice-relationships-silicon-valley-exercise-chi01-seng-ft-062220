class VentureCapitalist
    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select {|capitalists| capitalists.total_worth > 1000000000}
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(type, amount, startup, self)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self} 
    end

    def portfolio
        array = FundingRound.all.select {|round| round.venture_capitalist == self}
        array.map {|element| element.startup}
    end

    def biggest_investment
        array = FundingRound.all.select {|round| round.venture_capitalist == self}
        array2 = array.map {|element| element.investment}
        return array2.max
    end
    
    def invested
    end

end

class Startup
    attr_reader :founder
    attr_accessor :domain, :name

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @name = name
        @domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        @@all.find do |startups| 
            if startups.founder == founder_name
                return startups
             end
        end
    end

    def self.domains
        domains = @@all.map {|startup| startup.domain}
        return domains.uniq
    end


    def sign_contract(cap, type, amount)
        FundingRound.new(type, amount, self, cap)
    end

    def num_funding_rounds
        array = FundingRound.all.map {|rounds| rounds.startup}
        array.count(self)
    end

    def total_funds
        total = 0
        array = FundingRound.all.map {|rounds| rounds.investment}
        array.each {|investment| total += investment}
        total
    end

    def investors
        startups = FundingRound.all.each.select {|element| element.startup == self}
        caps = startups.map {|element| element.venture_capitalist}
        caps.uniq
    end

    def big_investors
        
    end
        
end

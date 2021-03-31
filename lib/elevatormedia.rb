class Elevatormedia
	attr_reader :installation
	attr_reader :total
	

	

	def initialize
		@installation = 1735
		@total = 12000

	end

	def price(total)
		@installation += total
	end
	
	

end


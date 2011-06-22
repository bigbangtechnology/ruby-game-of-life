class Tile
	attr_accessor :living
	
	def initialize
		@living = false
	end
	
	def living?
		@living
	end
 
	def make_living
		@living = true
	end
	
end
require 'tile'

class Grid
	def initialize		
		@data = []
	end
	
	def populate(width, height)
		width.times do |x| 
			@data << []
			
			height.times do |y| 
				@data[x] << Tile.new
				
			end
		end
		
		
	end
	
	def setLiving(x,y )
	tile = @data[x][y]
	tile.isLiving = true
	
	end
	
	def getTile(x,y)
		@data[x][y]
	end 
	
	def play
		
	end
	
end
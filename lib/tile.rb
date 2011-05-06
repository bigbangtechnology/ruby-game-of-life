class Tile
	
	attr_accessor :neighbours
	
	def initialize(initial_state)
		@current_state = initial_state
	end
	
	def calculate_next_state!
		life_counter = 0
		
		self.neighbours.each do |tile|
			if tile.alive? 
				life_counter += 1
			end
		end
		
		if !self.alive? 
			if life_counter == 3
				@next_state = true
			end
		end
		
	end
	
	def commit_state!
		@current_state = @next_state
		
	end

	def alive?
		@current_state
	end
end
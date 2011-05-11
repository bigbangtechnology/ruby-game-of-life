class Grid
	def initialize
		@grid = create_grid		
	end
	
	def current_grid
		@grid
	end
	
	def process_grid
		@new_grid = create_grid
		
		@grid.each_with_index do |grid_row, y|
			grid_row.each_with_index do |grid_square, x|
				active_squares = look_around(x, y)
				
				calculate_state(x, y, active_squares)
			end
		end
		
		@grid.replace(@new_grid)
	end
	
	def random_seed
		@grid.each_with_index do |grid_row, y|
			grid_row.each_with_index do |grid_square, x|
				@grid[y][x] = (rand > 0.5) ? true : false
			end
		end
	end
	
	private
	
	# look around the current square to figure out how
	# many active squares there are
	def look_around(x, y)
		active_squares = 0

		sequences = [
			{ :x => -1, :y =>  0 },
			{ :x =>  0, :y => -1 },
			{ :x =>  1, :y =>  0 },			
			{ :x =>  1, :y =>  0 },			
			{ :x =>  0, :y => -1 },			
			{ :x =>  0, :y => -1 },			
			{ :x => -1, :y =>  0 },															
			{ :x => -1, :y =>  0 }			
		]
		
		
		sequences.each do |position|
			x += position[:x]
			y += position[:y]
			
			if @grid[y][x] == true
				active_squares += 1
			end
		end
		
		active_squares
	end
	
	# grid square is the current square
	# active_squares is the number of active surrounding squares
	def calculate_state(x, y, active_squares)
		if (active_squares == 3 || active_squares == 2)
			@new_grid[y][x] = true
		end
	end
	
	def create_grid
		[
			[ false, false, false, false ],
			[ false, false, false, false ],	
			[ false, false, false, false ],
			[ false, false, false, false ]
		]
	end		
end
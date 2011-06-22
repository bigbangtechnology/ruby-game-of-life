class Board
	attr_accessor :rows, :columns
	
	def initialize(rows, columns)
		@rows = rows
		@columns = columns
		
		@grid = []
		@rows.times do |r|
			@grid[r] = []
			@columns.times do |c|
				@grid[r][c] = Tile.new
			end
		end
	end
	
	def each_tile(&block)
		@rows.times do |r|
			@columns.times do |c|
				yield @grid[r][c]
			end
		end
	end
	
	def set_living(row, column)
		@grid[row][column].make_living
	end
	
	def play
		
	end
	
	def get_count(row, column)
		count = 0
		
		count += 1 if @grid[row-1][column].living?
		count += 1 if @grid[row-1][column-1].living?
		count += 1 if @grid[row][column].living?
		count += 1 if @grid[row-1][column].living?
		count += 1 if @grid[row-1][column].living?
		count += 1 if @grid[row-1][column].living?
		count += 1 if @grid[row-1][column].living?
		count += 1 if @grid[row-1][column].living?
		
		
		
		count
	end
	
	def get_tile(row, column)
		@grid[row][column]
	end
	
end

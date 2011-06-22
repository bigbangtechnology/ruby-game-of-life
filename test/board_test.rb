require 'board'
require 'tile'
require 'test/unit'

class ExampleTest < Test::Unit::TestCase
  

	def test_board_creates_a_grid_of_supplied_dimensions
		sut = Board.new(3,3)
		
		assert !sut.nil?
		assert sut.rows == 3
		assert sut.columns == 3
	end
	
	def test_when_i_init_grid_all_tiles_should_be_dead
		sut = Board.new(3,3)
		
		sut.each_tile do |tile|
			assert !tile.living?
		end
	end
	
	def test_given_3_neighbours_are_living_tile_should_be_alive
		sut = Board.new(3,3)
		
		sut.set_living(0,0)
		sut.set_living(0,1)
		sut.set_living(0,2)
		
		sut.play
		
		tile = sut.get_tile(1,1)
		assert tile.living?
	end

end

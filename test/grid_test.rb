require 'grid'
require 'test/unit'

class TestGrid < Test::Unit::TestCase
  def test_proper_grid_size
		sut = Grid.new
		grid = sut.current_grid
		
		assert_equal 4, grid.length
		assert_equal 4, grid.first.length	
  end

	def test_create_tile
		sut = Grid.new
		grid = sut.current_grid
		grid[0][0] = true
		grid[1][0] = true
		grid[2][0] = true
		
		sut.process_grid

		assert_equal true, grid[1][1]
	end
	
	def test_isolate_tile
		sut = Grid.new
		grid = sut.current_grid
		grid[1][0] = true
		grid[1][1] = true
		
		sut.process_grid
		
		assert_equal false, grid[1][1]
	end
	
	def test_suffocate_tile
		sut = Grid.new
		grid = sut.current_grid
		grid[0][0] = true
		grid[1][0] = true
		grid[2][0] = true
		grid[2][1] = true
		grid[1][2] = true
		
		sut.process_grid
		
		assert_equal false, grid[1][2]
	end
	
	def test_survive_tile
		sut = Grid.new
		grid = sut.current_grid
		grid[0][1] = true
		grid[0][2] = true
		grid[1][1] = true
		
		sut.process_grid
		
		assert_equal true, grid[1][1]
	end
end
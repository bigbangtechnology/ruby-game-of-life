require 'tile'
require 'test/unit'

class TestExample < Test::Unit::TestCase
  def test_a_tile_comes_to_life_with_three_living_neighbors
		sut = Tile.new(false)
		sut.neighbours = get_active_tiles(3)
		
		sut.calculate_next_state!
		sut.commit_state!
		
		assert sut.alive?
  end

	def test_a_tile_stays_dead
		[0,1,4,5,6,7,8].each do |num|
			assert_dead_when(false, num)
		end
	end
	
	def test_a_tile_stays_alive
		sut = Tile.new(true)
		
		sut.neighbours = get_active_tiles(2)
		sut.calculate_next_state!
		sut.commit_state!
		
		assert sut.alive?
		
	end

	def test_a_tile_dies
		[0,1,4,5,6,7,8].each do |num|
			assert_dead_when(true, num)
		end
	end



		
	private
	
	def get_active_tiles(num_tiles)
		neighbours = []
			
		num_tiles.times do
			neighbours << Tile.new(true)
		end
		
		num_remaining = 8 - num_tiles
		
		num_remaining.times do 
			neighbours << Tile.new(false)
		end
		
		neighbours
	end
	
	def assert_dead_when(init_state, num_active)
		sut = Tile.new(init_state)
		sut.neighbours = get_active_tiles(num_active)
		
		sut.calculate_next_state!
		sut.commit_state!
		
		assert_equal false, sut.alive?
	end
end

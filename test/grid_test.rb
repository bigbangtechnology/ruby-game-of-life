require 'grid'
require 'tile'
require 'test/unit'

class GridTest < Test::Unit::TestCase
  def test_true
		sut = Grid.new
  end

	#A dead tile with exactly three living tiles surrounding it will become alive.
	def test_living
		grid = Grid.new
		grid.populate(3,3) 
		grid.setLiving(0, 0)
		grid.setLiving(0, 1)
		grid.setLiving(0, 2)	
		
		assert !grid.getTile(1,1).isLiving
		
		grid.play
		
		assert grid.getTile(1,1).isLiving 
	end

end


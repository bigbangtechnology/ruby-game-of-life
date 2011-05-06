require 'example'
require 'test/unit'

class TestExample < Test::Unit::TestCase
  def test_true
		sut = Example.new
		
		assert sut.working?
  end
end

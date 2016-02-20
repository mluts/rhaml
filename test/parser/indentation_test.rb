require 'test_helper'

class IndentationTest < Minitest::Test
  def indentation
    @char ||= " "
    @step ||= 2
    @indentation ||= RHaml::RealParser::Indentation.new(@char, @step)
  end

  def n
    @n ||= rand(10) + 2
  end

  def test_increment
    n.times { indentation.increment }
    assert_equal n, indentation.count
  end

  def test_reset
    n.times { indentation.increment }
    indentation.reset
    assert_equal 0, indentation.count
  end

  def test_index
    assert_equal 0, indentation.index
    @step.times { indentation.increment }
    assert_equal 1, indentation.index
    indentation.increment
    assert_equal nil, indentation.index
    (@step-1).times { indentation.increment }
    assert_equal 2, indentation.index
  end

  def test_char
    indentation
    assert_equal @char, indentation.char
  end
end

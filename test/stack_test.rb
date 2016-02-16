require 'test_helper'

class StackTest < Minitest::Test
  def stack
    @stack ||= RHaml::Parser::Stack.new
  end

  def test_top
    assert_equal [], stack.top
  end

  def test_bottom
    assert_equal [], stack.bottom
  end

  def test_push
    stack.push([:element])
    assert_equal [:element], stack.top
    assert_equal [], stack.bottom
  end

  def test_push2
    stack.push([:element1])
    stack.push([:element2])
    assert_equal [:element2], stack.top
    assert_equal [], stack.bottom
  end

  def test_slice
    stack.push([:element1])
    stack.push([:element2])
    stack.slice(1)
    assert_equal [], stack.top
    assert_equal [], stack.bottom
  end
end

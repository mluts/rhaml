require 'test_helper'

class IndentationTest < MiniTest::Test
  def setup
    @i = RHaml::Document::Indentation.new
  end

  def test_index_before_indenting
    assert_equal 0, @i.index
  end

  def test_indent_one_tab
    @i.tab
    assert_equal 1, @i.index
    @i.newline
    assert_equal 0, @i.index
    3.times { @i.tab }
    assert_equal 3, @i.index
    assert_raises(@i.class::Error) { @i.space }
  end

  def test_indent_two_tabs
    @i.tab
    @i.tab
    assert_equal @i.index, 1
  end

  def test_bad_indentation
    @i.tab
    @i.tab
    @i.index
    @i.newline
    @i.tab
    assert_raises(@i.class::Error) { @i.index }
  end
end

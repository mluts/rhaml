require 'test_helper'

class FilterTest < Minitest::Test
  def setup
    @filter = RHaml::Parser::Filter.new
  end

  def test_header
    assert_equal [:html, :doctype, @filter.default_doctype],
      @filter.call([:header])
  end

  def test_header_with_doctype
    doctype = 'the-string'
    assert_equal [:html, :doctype, doctype],
      @filter.call([:header, [:inline, doctype]])
  end

  def test_tag
    assert_equal [:html, :tag, 'div', [:multi], [:multi]], @filter.call([:tag, 'div'])
  end

  def test_tag_with_attributes
    assert_equal [:html, :tag, 'div', [:html, :attrs,
                                       [:html, :attr, 'class', [:dynamic, '2']],
                                       [:html, :attr, 'id', [:static, '1']]], [:multi]],
    @filter.call([:tag, 'div', [:attr, 'id', '1', :literal],
                  [:attr, 'class', '2']])
  end

  def test_tag_with_children
    assert_equal [:html, :tag, 'div', [:multi], [:multi,
                                                 [:html, :tag, 'p', [:multi], [:multi]],
                                                 [:html, :tag, 'em', [:multi], [:multi]]]], @filter.call([:tag, 'div', [:tag, 'p'], [:tag, 'em']])
  end

  def test_autoclose
    assert_equal [:html, :tag, 'div', [:multi]],
      @filter.call([:tag, 'div', [:autoclose]])
  end

  def test_text
    assert_equal [:dynamic, '"abc"'],
      @filter.call([:text, 'abc'])
  end

  def test_text_escaping
    assert_equal [:dynamic, '"abc\\"abc"'],
      @filter.call([:text, 'abc"abc'])
  end

  def text_in_tag
    assert_equal [:html, :tag, 'abc', [:multi], [:multi, [:static, 'abc']]],
      @filter.call([:tag, 'abc', [:text, 'abc']])
  end
end

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
                                       [:html, :attr, 'id', [:static, '1']],
                                       [:html, :attr, 'class', [:static, '2']]], [:multi]],
    @filter.call([:tag, 'div', [:attr, 'id', '1'],
                  [:attr, 'class', '2']])
  end

  def test_tag_with_children
    assert_equal [:html, :tag, 'div', [:multi], [:multi,
                                                 [:html, :tag, 'p', [:multi], [:multi]],
                                                 [:html, :tag, 'em', [:multi], [:multi]]]], @filter.call([:tag, 'div', [:tag, 'p'], [:tag, 'em']])
  end
end

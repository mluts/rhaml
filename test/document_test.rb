require 'test_helper'

class DocumentTest < Minitest::Test
  def setup
    @doc = RHaml::Parser::Document.new(data, indentation)
  end

  def indentation
    @indentation ||= RHaml::Parser::Indentation.new(' ', 2)
  end

  def data
    "hello world"
  end

  def test_element
    @doc.mark_element(:a, 0)
    @doc.write_element(3)
    assert_equal([[:a, 'hell']], @doc.compile)
  end

  def test_two_elements_without_termination
    @doc.mark_element(:a, 0)
    @doc.write_element(3)
    assert_raises do
      @doc.mark_element(:a, 0)
    end
  end

  def test_two_elements
    @doc.mark_element(:a, 0)
    @doc.write_element(4)
    @doc.terminate
    @doc.mark_element(:a, 0)
    @doc.write_element(4)
    assert_equal [[:a, 'hello'], [:a, 'hello']], @doc.compile
  end

  def test_nested_elements
    @doc.mark_element(:a, 0)
    @doc.write_element(4)
    @doc.terminate
    indentation.step.times do
      @doc.indent(indentation.char)
    end
    @doc.mark_element(:b, 0)
    @doc.write_element(4)
    assert_equal [[:a, 'hello', [:b, 'hello']]],
                 @doc.compile
  end

  def test_element_with_empty_attribute
    @doc.mark_element(:div, 0)
    @doc.write_element(4)
    @doc.mark_attr_name(6)
    @doc.write_attr_name(10)
    assert_equal [[:div, 'hello', [:attr, 'world', '']]],
      @doc.compile
  end

  def test_element_with_attributes
    @doc.mark_element(:div, 0)
    @doc.write_element(4)
    3.times do
      @doc.mark_attr_name(6)
      @doc.write_attr_name(10)
      @doc.mark_attr_val(6)
      @doc.write_attr_val(10)
    end
    assert_equal [[:div, 'hello', *([[:attr, 'world', 'world']]*3)]],
      @doc.compile
  end

  def test_inline_text
    @doc.mark_element(:div, 0)
    @doc.write_element(4)
    @doc.mark_inline_text(0)
    @doc.write_inline_text(4)
    assert_equal [[:div, 'hello', [:inline_text, 'hello']]], @doc.compile
  end

  def test_id_class_div
    @doc.mark_id_div(0)
    @doc.write_id_div(4)
    @doc.terminate
    indentation.step.times do
      @doc.indent(indentation.char)
    end

    @doc.mark_class_div(0)
    @doc.write_class_div(4)
    assert_equal [[:tag,
                   'div',
                   [:attr, 'id', 'hello'],
                   [:tag, 'div',
                    [:attr, 'class', 'hello']]]], @doc.compile
  end

  def test_id_class
    @doc.mark_element(:tag, 0)
    @doc.write_element(4)
    @doc.mark_class(0)
    @doc.write_class(0)

    @doc.mark_id(1)
    @doc.write_id(1)

    assert_equal [[:tag, 'hello',
                   [:attr, 'class', 'h'],
                   [:attr, 'id', 'e']]], @doc.compile
  end

  def test_header
    @doc.write_header
    assert_equal [[:header]], @doc.compile
  end

  def test_header_with_type
    @doc.write_header
    @doc.mark_inline_text(0)
    @doc.write_inline_text(4)
    assert_equal [[:header, [:inline_text, 'hello']]], @doc.compile
  end
end

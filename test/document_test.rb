require 'test_helper'

class DocumentTest < MiniTest::Test
  def setup
    @doc = RHaml::Document.new
  end

  def chain(obj, *calls)
    calls.each { |args| obj.send(*args) }
    obj
  end

  def test_compile1
    chain(@doc,
          :new_tag,
          [:append_to_tag_name, 'a'])
    assert_equal(@doc.compile,
                 [:multi, @doc.tags.first.compile])
  end

  def test_compile2
    chain(@doc,
         :new_tag,
         [:append_to_tag_name, 'a'],
         :newline,
         :indent_tab,
         :new_tag,
         [:append_to_tag_name, 'b'],
         :newline,
         :new_tag,
         [:append_to_tag_name, 'c'],
         :newline,
         :indent_tab,
         :new_tag,
         [:append_to_tag_name, 'd'])
    assert_equal(@doc.compile,
                [:multi,
                  @doc.tags[0].compile,
                  @doc.tags[1].compile])
  end
end

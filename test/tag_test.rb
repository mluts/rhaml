require 'test_helper'

class TagTest < Minitest::Test
  def new_tag(name = nil)
    RHaml::Document::Tag.new(name)
  end

  def tag_name
    @name ||= "name-#{rand(999)}"
  end

  def setup
    @tag = new_tag(tag_name)
  end

  def test_name
    assert_equal(tag_name, @tag.name)
  end

  def test_tags
    @tag.tags << new_tag("a")
    @tag.tags << new_tag("b")
    assert_equal(@tag.tags.map(&:name), %w(a b))
  end

  def test_compile_one
    assert_equal(@tag.compile, [:html,
                                :tag,
                                tag_name,
                                [:multi],
                                [:multi]])
  end

  def test_compile_with_one_nested
    @tag.tags << new_tag('a')
    assert_equal(@tag.compile,
                 [:html,
                  :tag,
                  tag_name,
                  [:multi],
                  [:multi, [:html,
                            :tag,
                            'a',
                            [:multi],
                            [:multi]
                           ]]
                 ])
  end

  def test_compile_with_two_nested
    @tag.tags << new_tag('a')
    @tag.tags << new_tag('b')
    assert_equal(@tag.compile,
                  [:html,
                   :tag,
                   tag_name,
                   [:multi],
                   [:multi,
                    [:html,
                     :tag,
                     'a',
                     [:multi],
                     [:multi]
                    ],
                    [:html,
                     :tag,
                     'b',
                     [:multi],
                     [:multi]]]])
  end
end

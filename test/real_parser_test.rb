require 'test_helper'

class RealParserTest < Minitest::Test
  def setup
    @parser = RHaml::RealParser.new
  end

  {
    "!!!" => [[:header]],
    "!!! XML" => [[:header, [:inline, 'XML']]],
    "!!! XML  " => [[:header, [:inline, 'XML  ']]],
    "!!!\n%a" => [[:header], [:tag, 'a']],
    "%a( attr=b )" => [[:tag, 'a', [:attr, 'attr', 'b']]],
    "%a.b.c#d#e{ a: a, :b => b, :c => c }" => [[:tag, 'a',
                      [:attr, 'class', "'b'"],
                      [:attr, 'class', "'c'"],
                      [:attr, 'id', "'d'"],
                      [:attr, 'id', "'e'"],
                      [:attr, 'a', 'a'],
                      [:attr, 'b', 'b'],
                      [:attr, 'c', 'c']]],
    "%a.b#c{ a: e } the inline text" => [[:tag, 'a',
                                          [:attr, 'class', "'b'"],
                                          [:attr, 'id', "'c'"],
                                          [:attr, 'a', 'e'], [:inline, 'the inline text']]],
    "%a\n  some text" => [[:tag, 'a', [:text, 'some text']]],
    ".a#b" => [[:tag, 'div', [:attr, 'class', "'a'"], [:attr, 'id', "'b'"]]],
    ".a\n  .b" => [[:tag, 'div',
                    [:attr, 'class', "'a'"],
                    [:tag, 'div',
                     [:attr, 'class', "'b'"]]]],
    ".a\n  .b\n  .c\n    .d" => [[:tag, 'div',
                                  [:attr, 'class', "'a'"],
                                  [:tag, 'div',
                                   [:attr, 'class', "'b'"]],
                                  [:tag, 'div', [:attr, 'class', "'c'"],
                                   [:tag, 'div', [:attr, 'class', "'d'"]]]]],

    '%meta{:content => "text/html; charset=UTF-8", "http-equiv" => "Content-Type"}/' =>
    [[:tag, 'meta',
      [:attr, 'content', '"text/html; charset=UTF-8"'],
      [:attr, '"http-equiv"', '"Content-Type"'], [:autoclose]]]
  }.each do |code, expectation|
    define_method("test_spec: #{code.inspect} -> #{expectation.inspect}") do
      assert_equal(expectation, @parser.call(code)[1..-1])
    end
  end
end

require 'test_helper'

class RealParserTest < Minitest::Test
  def setup
    @parser = RHaml::RealParser.new
  end

  {
    "!!!" => [[:header]],
    "!!! XML" => [[:header, 'XML']],
    "!!! XML  " => [[:header, 'XML  ']],
    "!!!\n%a" => [[:header], [:tag, 'a']],
    "%a( attr=b )" => [[:tag, 'a', [:attr, 'attr', 'b']]],
    "%a.b.c#d#e{ a: a, :b => b, :c => c }" => [[:tag, 'a',
                      [:class, 'b'],
                      [:class, 'c'],
                      [:id, 'd'],
                      [:id, 'e'],
                      [:attr, 'a', 'a'],
                      [:attr, 'b', 'b'],
                      [:attr, 'c', 'c']]]
  }.each do |code, expectation|
    define_method("test_spec: #{code.inspect} -> #{expectation.inspect}") do
      assert_equal(expectation, @parser.call(code))
    end
  end
end

require 'test_helper'

class EngineTest < MiniTest::Test
  def setup
    @engine = RHaml::Engine.new
  end

  def render(template)
    eval(RHaml::Engine.new.call(template))
  end

  EXAMPLES = {
    "%a\n  %b\n    %c" => "<a><b><c></c></b></a>",
    "%a\n  \n%b\n  %c" => "<a></a><b><c></c></b>"
  }

  EXAMPLES.each do |code, result|
    define_method("test_example: #{code.inspect}") do
      assert_equal(render(code), result)
    end
  end
end

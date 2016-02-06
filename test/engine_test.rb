require 'test_helper'

class RendererTest < MiniTest::Test
  def setup
    @engine = RHaml::Renderer.new
  end

  def render(template)
    eval(@engine.call(template))
  end

  EXAMPLES = {
    "%a\n  %b\n    %c"          => "<a><b><c></c></b></a>",
    "%a   \r\t  \n  %b\n    %c" => "<a><b><c></c></b></a>",
    "%a\n  \n%b\n  %c"          => "<a></a><b><c></c></b>",
    "%a\n  %b\n  %c"            => "<a><b></b><c></c></a>"
  }

  EXAMPLES.each do |code, result|
    define_method("test_example: #{code.inspect}") do
      assert_equal(render(code), result)
    end
  end
end

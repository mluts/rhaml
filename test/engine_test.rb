require 'test_helper'

class EngineTest < MiniTest::Test
  def setup
    @engine = RHaml::Engine.new
  end

  def render(template)
    RHaml::Engine.new.call(template)
  end

  TEMPLATE1 = <<EOF
%a
  %b
    %c
%d
  %e
    %f
EOF

  RESULT1 = "<a><b><c></c></b></a><d><e><f></f></e></d>"

  def test_basic_haml
    assert_equal(eval(render(TEMPLATE1)), RESULT1.strip)
  end
end

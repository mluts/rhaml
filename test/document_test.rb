require 'test_helper'

class DocumentTest < Minitest::Test
  def setup
    @doc = RHaml::Parser::Document.new
  end

  def indentation
    @indentation ||= RHaml::Parser::Indentation.new(' ', 2)
  end

  def data
    "%a.b.c(a=1) inline"
  end
end

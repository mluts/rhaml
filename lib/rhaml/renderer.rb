require 'rhaml/parser'
require 'rhaml/html/pretty'

module RHaml
  ParseError = Class.new(StandardError)

  class Renderer < ::Temple::Engine
    use RHaml::Parser

    use RHaml::HTML::Pretty

    filter :MultiFlattener
    filter :StaticMerger
    filter :DynamicInliner

    generator :ArrayBuffer
  end
end

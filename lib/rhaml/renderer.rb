require 'rhaml/parser'

module RHaml
  ParseError = Class.new(StandardError)

  class Renderer < ::Temple::Engine
    use RHaml::Parser

    html :Pretty

    filter :MultiFlattener
    filter :StaticMerger
    filter :DynamicInliner

    generator :ArrayBuffer
  end
end

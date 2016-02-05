require 'rhaml/parser'

module RHaml
  ParseError = Class.new(StandardError)

  class Engine < ::Temple::Engine
    use RHaml::Parser

    html :Fast

    filter :MultiFlattener
    filter :StaticMerger
    filter :DynamicInliner

    generator :ArrayBuffer
  end
end

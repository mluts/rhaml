require 'rhaml/html/pretty'
require 'rhaml/html/dispatcher_ext'

module RHaml
  ParseError = Class.new(StandardError)

  class Renderer < ::Temple::Engine
    use RHaml::RealParser

    use RHaml::Parser::Filter
    html :AttributeMerger
    html :AttributeSorter
    use RHaml::HTML::Pretty

    filter :MultiFlattener
    filter :StaticMerger
    filter :DynamicInliner

    generator :ArrayBuffer
  end
end

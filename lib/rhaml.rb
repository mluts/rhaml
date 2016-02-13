require 'temple'
require 'rhaml/parser'
require 'rhaml/real_parser'

module RHaml
  Error = Class.new(StandardError)
  SyntaxError = Class.new(Error)
  require 'rhaml/engine'
end

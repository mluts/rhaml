require 'temple'
require 'micromachine'
require 'rhaml/html/pretty'
require 'rhaml/parser'
require 'rhaml/real_parser'

module RHaml
  Error = Class.new(StandardError)
  SyntaxError = Class.new(Error)
  require 'rhaml/engine'
end

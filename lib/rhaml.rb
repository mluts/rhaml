require 'temple'

module RHaml
  Error = Class.new(StandardError)
  SyntaxError = Class.new(Error)
  require 'rhaml/engine'
end

require 'temple'
require 'micromachine'
require 'rhaml/html/pretty'
require 'rhaml/html/ids_merger'
require 'rhaml/html/attribute_sorter'
require 'rhaml/html/dispatcher_ext'
require 'rhaml/parser'
require 'rhaml/real_parser'

module RHaml
  Error = Class.new(StandardError)
  SyntaxError = Class.new(Error)
  require 'rhaml/engine'
end

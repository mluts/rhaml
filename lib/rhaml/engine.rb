require 'rhaml/renderer'

module RHaml
  class Engine
    def initialize(template, options = {})
      @template = template
      @options = default_options.merge(options)
      @renderer = RHaml::Renderer.new(@options)
    end

    def default_options
      {
        format: :xhtml,
        attr_quote: "'"
      }
    end

    def render(object = Object.new, locals = {})
      eval(@renderer.call(@template), object.instance_eval{binding})
    end
  end
end

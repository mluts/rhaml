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
        attr_quote: "'",
        indent_tags: %w(article aside audio base body datalist dd div dl dt
                        fieldset figure footer form head h1 h2 h3 h4 h5 h6
                        header hgroup hr html li link meta nav ol option p
                        rp rt ruby section script style table tbody td tfoot
                        th thead tr ul video doctype).freeze
      }
    end

    def render(object = Object.new, locals = {})
      eval(@renderer.call(@template), object.instance_eval{binding})
    end
  end
end

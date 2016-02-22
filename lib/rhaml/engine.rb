require 'rhaml/renderer'

module RHaml
  class Engine
    def initialize(template, options = {})
      @template = template
      @options = default_options.merge(options)
    end

    def default_options
      {
        format: :html,
        attr_quote: "'",
        indent_tags: %w(article aside audio base body datalist dd div dl dt
                        fieldset figure footer form head h1 h2 h3 h4 h5 h6
                        header hgroup hr html li link meta nav ol option p
                        rp rt ruby section script style table tbody td tfoot
                        th thead tr ul video doctype).freeze
      }
    end

    def render(object = Object.new, locals = {})
      scope = object.instance_eval{binding}
      set_locals(locals, scope, object)
      eval(RHaml::Renderer.new(@options.merge(scope: scope)).call(@template), scope)
    end

    def set_locals(locals, scope, scope_object)
      scope_object.instance_variable_set :@_rhaml_locals, locals
      set_locals = locals.keys.map { |k| "#{k} = @_rhaml_locals[#{k.inspect}]" }.join("\n")
      eval(set_locals, scope)
    end
  end
end

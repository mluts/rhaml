require 'rhaml/parser/stack'
require 'rhaml/parser/indentation'
require 'rhaml/parser/document'

module RHaml
  class RealParser < RHaml::Parser
    def initialize
      super(self)
    end

    def call(input)
      @output = []
      @stack = [@output]
      parse(input)
      @output
    end

    def on_new_header(input, p)
      @output << [:header]
    end

    def on_start_tag(input, p)
      @output << [:tag, p]
    end

    def on_finish_tag(input, p)
      element = @output.last
      last = element.length-1
      element[last] = input[element[last]..p]
    end

    def on_start_inline_text(input, p)
      @output.last << p
    end

    def on_finish_inline_text(input, p)
      element = @output.last
      last = element.length-1
      element[last] = input[element[last]..p]
    end

    def on_start_attr_name(input, p)
      @output.last << [:attr, p]
    end

    def on_finish_attr_name(input, p)
      attr = @output.last.last
      last = attr.length-1
      attr[last] = input[attr[last]..p]
    end

    def on_start_attr_val(input, p)
      attr = @output.last.last
      attr << p
    end

    def on_finish_attr_val(input, p)
      attr = @output.last.last
      last = attr.length-1
      attr[last] = input[attr[last]..p]
    end

    def on_start_filter(input, p)
      @output << [:filter, p]
    end

    def on_finish_filter(input, p)
      filter = @output.last
      last = filter.length-1
      filter[last] = input[filter[last]..p]
    end

    def on_start_id(input, p)
      @output.last << [:id, p]
    end

    def on_finish_id(input, p)
      id = @output.last.last
      last = id.length-1
      id[last] = input[id[last]..p]
    end

    def on_start_class(input, p)
      @output.last << [:class, p]
    end

    def on_finish_class(input, p)
      klass = @output.last.last
      last = klass.length-1
      klass[last] = input[klass[last]..p]
    end

    def on_start_class_div(input, p)
      @output << [:class_div, p]
    end

    def on_finish_class_div(input, p)
      element = @output.last
      last = element.length-1
      element[last] = input[element[last]..p]
    end

    def on_start_id_div(input, p)
      @output << [:id_div, p]
    end

    def on_finish_id_div(input, p)
      element = @output.last
      last = element.length-1
      element[last] = input[element[last]..p]
    end

    def on_start_text(input, p)
      @output << [:text, p]
    end

    def on_finish_text(input, p)
      @output.last[1] = input[@output.last[1]..p]
    end

    def on_tab_indent(input, p)
    end

    def on_space_indent(input, p)
      @output << [:space]
    end

    def on_newline(*)
    end
  end
end

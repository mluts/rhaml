require 'rhaml/parser/stack'
require 'rhaml/parser/indentation'
require 'rhaml/parser/document'
require 'rhaml/parser/filter'

module RHaml
  class RealParser < RHaml::Parser
    def initialize
      super(self)
    end

    def call(input)
      @doc = RHaml::Parser::Document.new(input.dup,
                                              RHaml::Parser::Indentation.new(' ', 2))
      parse(input)
      @doc.compile
    end

    def on_new_header(*)
      @doc.write_header
    end

    def on_start_tag(input, p)
      @doc.mark_element(:tag, p)
    end

    def on_finish_tag(input, p)
      @doc.write_element(p)
    end

    def on_start_inline_text(input, p)
      @doc.mark_inline_text(p)
    end

    def on_finish_inline_text(input, p)
      @doc.write_inline_text(p)
    end

    def on_start_attr_name(input, p)
      @doc.mark_attr_name(p)
    end

    def on_finish_attr_name(input, p)
      @doc.write_attr_name(p)
    end

    def on_start_attr_val(input, p)
      @doc.mark_attr_val(p)
    end

    def on_finish_attr_val(input, p)
      @doc.write_attr_val(p)
    end

    def on_start_filter(input, p)
      @doc.mark_element(:filter, p)
    end

    def on_finish_filter(input, p)
      @doc.write_element(:filter, p)
    end

    def on_start_id(input, p)
      @doc.mark_id(p)
    end

    def on_finish_id(input, p)
      @doc.write_id(p)
    end

    def on_start_class(input, p)
      @doc.mark_class(p)
    end

    def on_finish_class(input, p)
      @doc.write_class(p)
    end

    def on_start_class_div(input, p)
      @doc.mark_class_div(p)
    end

    def on_finish_class_div(input, p)
      @doc.write_class_div(p)
    end

    def on_start_id_div(input, p)
      @doc.mark_id_div(p)
    end

    def on_finish_id_div(input, p)
      @doc.write_id_div(p)
    end

    def on_start_text(input, p)
      @doc.mark_element(:text, p)
    end

    def on_finish_text(input, p)
      @doc.write_element(p)
    end

    def on_tab_indent(input, p)
      @doc.indent("\t")
    end

    def on_space_indent(input, p)
      @doc.indent(" ")
    end

    def on_newline(*)
      @doc.terminate
    end
  end
end

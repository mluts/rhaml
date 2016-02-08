require 'rhaml/document/indentation'
require 'rhaml/document/header'
require 'rhaml/document/tag'
require 'rhaml/document/attribute'
require 'rhaml/document/text'

module RHaml
  class Document
    attr_reader :tags

    def initialize(options = {})
      @tags = []
      @doctype = nil
      @line = 0
      @stack = []
      @indentation = Indentation.new
      @options = options
    end

    def indent_tab
      @indentation.tab
    end

    def indent_space
      @indentation.space
    end

    def newline
      @indentation.newline
    end

    def new_tag
      if @indentation.index == 0
        tag = Tag.new
        @tags << tag
        @stack = [tag]
      else
        if (parent = @stack[@indentation.index-1]).nil?
          raise SyntaxError.new("Wrong indentation on line #{@indentation.line} (#{@indentation.index})!")
        else
          tag = Tag.new
          @stack.slice!(@indentation.index..-1)
          @stack[@indentation.index] = tag
          parent.elements << tag
        end
      end
      tag
    end

    def append_to_tag_name(char)
      raise "No tag for this indentation!" if @stack[@indentation.index].nil?
      @stack.last.name << char
    end

    def header
      if @indentation.index > 0
        raise SyntaxError.new("Indentation for header is prohibited")
      else
        @tags << Header.new(@options.fetch(:format, :xhtml))
      end
    end

    def header_char(char)
      if @tags.last.is_a?(Header)
        @tags.last.name << char
      else
        raise RHaml::Error.new("Expected to have header, but had #{@tags.last.inspect}")
      end
    end

    def compile
      [:multi, *@tags.map(&:compile)]
    end

    def div
      tag = new_tag
      tag.name << "div"
      tag
    end

    def id_char(char)
      @stack.last.id << char
    end

    def class_char(char)
      @stack.last.klass << char
    end

    def start_id
      @stack.last.id.clear
    end

    def start_class
      if !@stack.last.klass.empty?
        @stack.last.klass << " "
      end
    end

    def auto_close
      @stack.last.auto_close
    end

    def new_text
      tag = @stack[@indentation.index-1]

      unless tag.is_a?(Tag)
        raise SyntaxError.new("Wrong indentation for text on line #{@indentation.line} - #{@indentation.count} chars")
      end
      text = tag.elements.last
      if !text.is_a?(Text)
        text = Text.new
        tag.elements << text
      end
      @stack.slice!(@indentation.index..-1)
      @stack[@indentation.index] = text
    end

    def text_char(char)
      @stack.last.content << char
    end

    def inline_text_char(char)
      unless @stack.last.is_a?(Tag)
        raise RHaml::Error.new("Can't insert inline text to #{@stack.last.inspect}")
      end

      @stack.last.inline_text << char
    end

    def new_attribute
      @stack.last.attributes << Attribute.new
    end

    def attribute_name(char)
      @stack.last.attributes.last.name << char
    end

    def new_attribute_var
    end

    def attribute_var_name(char)
      @stack.last.attributes.last.value << char
    end

    def new_attribute_str
    end

    def attribute_str_char(char)
      @stack.last.attributes.last.value << char
    end
  end
end

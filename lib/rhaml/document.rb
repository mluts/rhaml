require 'rhaml/document/indentation'
require 'rhaml/document/tag'
require 'rhaml/document/header'

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
          parent.tags << tag
        end
      end
      @tag
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
  end
end

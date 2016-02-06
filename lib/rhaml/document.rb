require 'rhaml/document/tag'
require 'rhaml/document/indentation'

module RHaml
  class Document
    attr_reader :tags

    def initialize
      @tags = []
      @doctype = nil
      @line = 0
      @stack = []
      @indentation = Indentation.new
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
          raise ParseError.new("Wrong indentation on line #{@indentation.line} (#{@indentation.index})!")
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

    def compile
      [:multi, *@tags.map(&:compile)]
    end
  end
end

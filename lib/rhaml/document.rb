module RHaml
  class Document
    class Tag
      attr_reader :name
      attr_reader :tags

      def initialize(name = "")
        @name = name
        @tags = []
      end

      def compile
        compiled_tags = tags.map(&:compile)
        [:html,
         :tag,
         name,
         [:multi],
         compiled_tags.any? ? [:multi, *compiled_tags] : [:multi]]
      end
    end

    attr_reader :tags

    def initialize
      @tags = []
      @doctype = nil
      @indentation = 0
      @line = 0
      @stack = []
    end

    def indent
      @indentation += 1
    end

    def newline
      @line += 1
      @indentation = 0
    end

    def new_tag
      if @indentation == 0
        tag = Tag.new
        @tags << tag
        @stack = [tag]
      else
        if (parent = @stack[@indentation-1]).nil?
          raise ParseError.new("Wrong indentation on line #{@line} (#{@indentation})!")
        else
          tag = Tag.new
          @stack.slice!(@indentation..-1)
          @stack[@indentation] = tag
          parent.tags << tag
        end
      end
      @tag
    end

    def append_to_tag_name(char)
      raise "No tag for this indentation!" if @stack[@indentation].nil?
      @stack.last.name << char
    end

    def compile
      [:multi, *@tags.map(&:compile)]
    end
  end
end

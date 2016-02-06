module RHaml
  class Document
    class Tag
      attr_reader :name, :elements, :id, :klass, :inline_text

      def initialize(name = "")
        @name = name
        @elements = []
        @id = ""
        @klass = ""
        @attributes = []
        @auto_close = false
        @inline_text = ""
      end

      def compile
        children_elements =
          if @inline_text.empty?
            elements.map(&:compile)
          else
            [[:static, @inline_text]]
          end

        attributes = compile_attributes

        exp = [:html, :tag]

        exp << :inline if !@inline_text.empty?

        exp << @name

        if attributes.any?
          exp << [:html, :attrs, *attributes]
        else
          exp << [:multi]
        end

        if !@auto_close
          exp << [:multi, *children_elements]
        end

        exp
      end

      def compile_attributes
        if !@klass.empty?
          @attributes << Attribute.new("class", @klass)
        end

        if !@id.empty?
          @attributes << Attribute.new("id", @id)
        end

        @attributes.map(&:compile)
      end

      def auto_close
        @auto_close = true
      end
    end
  end
end

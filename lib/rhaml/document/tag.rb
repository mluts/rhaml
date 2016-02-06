module RHaml
  class Document
    class Tag
      attr_reader :name, :tags, :id, :klass

      def initialize(name = "")
        @name = name
        @tags = []
        @id = ""
        @klass = ""
        @attributes = []
        @auto_close = false
      end

      def compile
        children_tags = tags.map(&:compile)
        attributes = compile_attributes

        exp = [:html, :tag, @name]

        if attributes.any?
          exp << [:html, :attrs, *attributes]
        else
          exp << [:multi]
        end

        if !@auto_close
          exp << [:multi, *children_tags]
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

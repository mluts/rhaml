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
      end

      def compile
        children_tags = tags.map(&:compile)
        attributes = compile_attributes
        [:html,
         :tag,
         name,
         attributes.any? ? [:html, :attrs, *attributes] : [:multi],
         children_tags.any? ? [:multi, *children_tags] : [:multi]]
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
    end
  end
end

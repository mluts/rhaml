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
  end
end

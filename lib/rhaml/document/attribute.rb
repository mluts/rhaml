module RHaml
  class Document
    class Attribute
      attr_reader :name, :value
      def initialize(name = "", value = "")
        @name = name
        @value = value
      end

      def compile
        [:html, :attr, @name, [:static, @value]]
      end
    end
  end
end

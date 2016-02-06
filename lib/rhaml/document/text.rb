module RHaml
  class Document
    class Text
      attr_reader :content

      def initialize
        @content = ""
      end

      def compile
        [:static, @content]
      end
    end
  end
end

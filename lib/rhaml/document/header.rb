module RHaml
  class Document
    class Header
      attr_reader :name

      def initialize(format = :xhtml)
        @name = ""
        @format = format
      end

      def compile
        if @format.to_s[0..3] == "html" && @name == "XML"
          [:static, ""]
        else
          [
            :html,
            :doctype,
            @name.empty? ? default_doctype : @name
          ]
        end
      end

      def default_doctype
        case @format
        when :xml, :xhtml, :html4 then 'transitional'
        else 'html'
        end
      end
    end
  end
end

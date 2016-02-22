module RHaml
  module HTML
    class AttributeSorter < Temple::HTML::AttributeSorter
      def on_html_attrs(*attrs)
        n = 0 # Use n to make sort stable. This is important because the merger could be executed afterwards.
        [:html, :attrs, *attrs.sort_by do |attr|
          raise(InvalidExpression, 'Attribute is not a html attr') if attr[0] != :html || attr[1] != :attr
          [attr[2].to_s, attr[3].to_s, n += 1]
        end]
      end
    end
  end
end

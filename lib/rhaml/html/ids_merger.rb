module RHaml
  module HTML
    class IdsMerger < Temple::HTML::Filter
      def on_html_attrs(*attrs)
        id = []
        attrs.reject! do |html_attr|
          if html_attr[2] == 'id'
            id << html_attr[3][1].to_s
            true
          else
            false
          end
        end
        attrs.unshift([:html, :attr, 'id', [:static, id.join('_')]]) if id.any?
        [:html, :attrs, *attrs]
      end
    end
  end
end

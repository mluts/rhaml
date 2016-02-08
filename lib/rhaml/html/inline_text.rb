module RHaml
  module HTML
    class InlineText < Temple::HTML::Pretty
      def on_html_tag_inline(name, *args)
        old_pretty, @pretty = @pretty, false
        @indent_text = true
        [:multi, [:static, tag_indent(name)], [:html, :tag, name, *args]]
      ensure
        @pretty = old_pretty
      end
    end
  end
end

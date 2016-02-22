module RHaml
  module HTML
    class Pretty < Temple::HTML::Pretty
      def initialize(opts = {})
        if %i(html4 xhtml).include?(opts[:format])
          @default_doctype = 'transitional'
        end

        super
      end

      def on_html_tag_inline(name, *args)
        old_pretty, @pretty = @pretty, false
        @indent_text = true
        [:multi, [:static, tag_indent(name)], compile([:html, :tag, name, *args])]
      ensure
        @pretty = old_pretty
      end

      def on_html_doctype(type)
        type = type.to_s.downcase

        if type =~ /^xml(\s+(.+))?$/
          if @format == :html
            str = ''
          else
            w = options[:attr_quote]
            str = "<?xml version=#{w}1.0#{w} encoding=#{w}#{$2 || 'utf-8'}#{w} ?>"
          end
        elsif type == 'html' && @default_doctype
          str = DOCTYPES[@format][@default_doctype]
        else
          str = DOCTYPES[@format][type] || raise(FilterError, "Invalid doctype #{type}")
        end

        [:static, str]
      end
    end
  end
end

class RHaml::Parser::Filter < Temple::Filter
  attr_reader :default_doctype

  def initialize(opts = {})
    @options = opts.dup
    super
    @default_doctype = @options[:default_doctype] || 'html'
  end

  def on_header(doctype = default_doctype)
    case doctype
    when String
    when Array
      if doctype[0] == :inline
        doctype = doctype[1]
      else
        raise "Wrong doctype! #{doctype.inspect}"
      end
    else
      raise "Wrong doctype! #{doctype.inspect}"
    end

    [:html, :doctype, doctype]
  end

  def on_tag(name, *elements)
    attrs = [:html, :attrs]
    children = [:multi]
    tag = [:html, :tag, name, attrs, children]
    elements.each do |element|
      if element[0] == :attr
        attrs << compile(element)
      else
        children << compile(element)
      end
    end
    attrs.replace([:multi]) if attrs[2].nil?
    tag
  end

  def on_attr(name, value = '')
    [:html, :attr, name, [:static, value]]
  end

  def on_inline(text)
    [:static, text]
  end
end

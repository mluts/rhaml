class RHaml::Parser::Filter < Temple::Filter
  attr_reader :default_doctype

  define_options :format => :html,
                 :scope => Object.new.instance_eval{binding}

  def initialize(opts = {})
    super
    @scope = options[:scope]
    @default_doctype = options[:default_doctype] || 'html'
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
    attrs = []
    children = [:multi]
    autoclose = false
    inline = false

    css_id_attrs = []
    css_attrs = []

    elements.each do |element|
      case element[0]
      when :autoclose
        autoclose = true
      when :attr
        if element.last == :css
          if element[1] == 'id'
            css_id_attrs << compile(element)
          else
            css_attrs << compile(element)
          end
        else
          attrs << compile(element)
        end
      when :inline
        inline = true
        children << compile(element)
      else
        children << compile(element)
      end
    end

    attrs.unshift(*css_attrs)
    attrs.unshift(css_id_attrs.last) if css_id_attrs.any?

    tag =
      if inline
        [ :html, :tag, :inline, name, attrs.any? ? [:html, :attrs, *attrs] : [:multi], children ]
      else
        [ :html, :tag, name, attrs.any? ? [:html, :attrs, *attrs] : [:multi], children ]
      end

    tag.pop if autoclose

    tag
  end

  def on_attr(name, value = '', css = nil)
    name.slice!(1..-2) if %w('").include?(name[0])
    value =
      if value == 'true'
        if options[:format] == :html
          [:multi]
        else
          [:static, name]
        end
      elsif value == ''
        [:multi]
      else
        if css
          [:static, value]
        else
          [:static, @scope.eval(value)]
        end
      end
    [:html, :attr, name, value]
  end

  def on_inline(text)
    [:static, text]
  end

  def on_text(text)
    [:dynamic, '"%s"' % text.gsub('"') { |m| "\\#{m}" }]
  end

  def on_comment(*nested)
    exp = [:html, :comment]
    children = [:multi]
    if nested[0] && nested[0][0] == :inline
      children.push([:static, ' '],
                    compile(nested.shift),
                    [:static, ' '])
    end

    children.push(*nested.map(&method(:compile)))
    exp.push(children)
    exp
  end
end

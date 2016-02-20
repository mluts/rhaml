class RHaml::Parser::Filter < Temple::Filter
  attr_reader :default_doctype

  define_options :format => :html

  def initialize(opts = {})
    @options = opts
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
    autoclose = false


    id_attrs = []

    elements.each do |element|
      if element[0] == :autoclose
        autoclose = true
      elsif element[0] == :attr
        if element[1] == 'id'
          id_attrs << compile(element)
        else
          attrs << compile(element)
        end
      else
        children << compile(element)
      end
    end

    attrs.push(id_attrs.last) if id_attrs.any?

    attrs.replace([:multi]) if attrs[2].nil?
    tag.pop if autoclose
    tag
  end

  def on_attr(name, value = '', literal = nil)
    name.slice!(1..-2) if %w('").include?(name[0])
    value =
      if value == 'true'
        if @options[:format] == :html
          [:multi]
        else
          [:static, name]
        end
      elsif value == ''
        [:multi]
      else
        [literal ? :static : :dynamic, value]
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

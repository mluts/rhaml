class Temple::HTML::AttributeMerger
  def on_html_tag_inline(name, attrs, children = nil)
    [:html, :tag, :inline, name, compile(attrs), children]
  end
end

class Temple::HTML::AttributeSorter
  def on_html_tag_inline(name, attrs, children = nil)
    [:html, :tag, :inline, name, compile(attrs), children]
  end
end

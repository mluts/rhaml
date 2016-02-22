module Temple::HTML::Dispatcher
  def on_html_tag_inline(name, attrs, children = nil)
    [:html, :tag, :inline, name, compile(attrs), children]
  end
end

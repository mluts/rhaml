%%{
  machine rhaml_common;

  action return { fret; }

  action call_html_attributes { fcall html_attributes; }
  
  action call_ruby_attributes { fcall ruby_attributes; }

  indentation = (' '$indent_space | [\t]$indent_tab);

  newlines = ([\n]$newline (space* -- ([\n] | indentation)))+ ;

  name_chars = alnum | "_" ;

  var = (alpha | "_") (name_chars)*;

  name = name_chars ((("-" | ":") name_chars) | name_chars)* ;

  attribute_name = name$attribute_name >new_attribute;

  attribute_var = var>new_attribute_var $attribute_var_name;

  str = ("'" ([^'] | "\\'")* "'") | ('"' ([^"] | '\\"')* '"');

  attribute_str = str>new_attribute_str $attribute_str_char ;

  html_attribute =
    attribute_name space* ("=" space* (attribute_var | attribute_str))? ;

  html_attributes :=
    space*
    html_attribute (space html_attribute)* :>> ")"@return;

  ruby_attributes := 
    space*
    var>new_attribute $attribute_name
    ( ":" | (space* "=>") )
    space*
    (attribute_var | attribute_str) ;

  attributes = ( "(" @call_html_attributes ) | ( "{" @call_ruby_attributes );

  tag_name = name$tag_name ;

  tag_class = (name_chars | "-" | ":" )+ $tag_class ;

  tag_id = name$tag_id;

  tag_inline_text = (space - [\n]) ((any - [\n]) (any - [\n])*) $tag_inline_text ;

  tag =
    "%">new_tag tag_name
    (("#">start_id tag_id) | (".">start_class tag_class))*
    ("/"$auto_close)?
    attributes?

    tag_inline_text?
    ;

  header =
    "!!!">new_header ((space -- [\n])+ [^\n]+$header_name)?;

  id_div = "#">new_div tag_id;

  class_div = ".">new_div tag_class;

  div = (id_div | class_div) attributes?  tag_inline_text?   ;

  text = (any - (indentation | "#" | "." | "%" | "!"))$text_name >new_text (any$text_name)*;

  element = header | div | tag | text ;

  haml = indentation* element :>> (newlines indentation* element)* ;

  main := haml;
}%%

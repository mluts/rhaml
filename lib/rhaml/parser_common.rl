%%{
  machine rhaml_common;

  action return { fret; }

  action call_attributes { fcall attributes; }

  indentation = (' '$indent_space | [\t]$indent_tab);

  newlines = ((space* -- [\n]) [\n]$newline (space* -- ([\n] | indentation)))+ ;

  var = (alpha | "_")+;

  str =
    ("'" ([^'] | "\\'")* "'") | ('"' ([^"] | '\\"')* '"');

  name = alpha (("-" alpha) | alpha)* ;

  attribute_name = name$attribute_name >new_attribute;

  attribute_var = var>new_attribute_var $attribute_var_name;

  attribute_str = str>new_attribute_str $attribute_str_char;

  html_attribute =
    attribute_name space* "=" space* (attribute_var | attribute_str);

  html_attributes =
    html_attribute (space+ html_attribute)*;

  attributes := html_attributes ")"@return;

  tag_name = name$tag_name;

  tag =
    "%">new_tag tag_name
    (
      "("@call_attributes
    )?;

  header = "!!!">new_header ((space -- [\n])+ [^\n]+$header_name)?;

  element = header | tag;

  haml = (indentation* element :>> newlines )* ;

  main := haml;
}%%

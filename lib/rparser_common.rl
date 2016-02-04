%%{
  machine chaml_common;

  action return { fret; }

  action call_attributes {
    fcall attributes;
  }

  indentation = "  "@indent;

  var = (alpha | "_")+;

  spc = [ \n\t];

  str =
    ("'" ([^'] | "\\'")* "'") | ('"' ([^"] | '\\"')* '"');

  name = alpha (("-" alpha) | alpha)* ;

  attribute_name = name$attribute_name >new_attribute;

  tag_name = name$tag_name;

  attribute_var = var>new_attribute_var $attribute_var_name;

  attribute_str = str>new_attribute_str $attribute_str_char;

  html_attribute =
    attribute_name spc* "=" spc* (attribute_var | attribute_str);

  html_attributes =
    html_attribute (spc+ html_attribute)*;

  attributes := html_attributes ")"@return;

  tag =
    "%">new_tag tag_name
    (
      "("@call_attributes
    )?;

  element = tag;

  haml = (indentation* element [\n])* ;

  main := haml;
}%%

require 'rhaml/document'

module RHaml
  class Parser
    def initialize(options = {})
      @options = options
    end

    def call(text)
      cs = 0
      data = text
      p = 0
      pe = text.length
      top = 0
      stack = []

      document = Document.new

      %%{
        machine rhaml_parser;

        action indent { document.indent }
        action new_tag { document.new_tag }
        action tag_name { document.append_to_tag_name(data[fpc]) }
        action newline { document.newline }

        action new_attribute {
          #tag.attributes << Attribute.new
        }

        action attribute_name {
          #tag.attributes.last.name << data[fpc]
        }

        action new_attribute_var {
          #tag.attributes.last.value = Variable.new
        }

        action attribute_var_name {
          #tag.attributes.last.value.name << data[fpc]
        }

        action new_attribute_str {
          #tag.attributes.last.value = ""
        }

        action attribute_str_char {
          #tag.attributes.last.value << data[fpc]
        }

        include rhaml_common "parser_common.rl";
        write data;
        write init;
        write exec;
      }%%

      if cs == rhaml_parser_error
        coords = linecol(text, p)
        raise ParseError.new("ParseError at #{coords.join(':')}\n#{text.lines[coords[0]-1..coords[0]+1].inspect}")
      end

      document.compile
    end

    def linecol(text, p)
      line = 0
      col = 0
      text.chars.each do |c|
        if c == "\n"
          line += 1
          col = 0
        elsif c == text[p]
          break
        else
          col += 1
        end
      end
      [line, col]
    end
  end
end

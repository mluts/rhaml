require 'rhaml/document'

module RHaml
  class Parser
    Error = Class.new(RHaml::Error)

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

      document = Document.new(@options)

      %%{
        machine rhaml_parser;

        action indent_tab { document.indent_tab }
        action indent_space { document.indent_space }
        action new_tag { document.new_tag }
        action tag_name { document.append_to_tag_name(data[fpc]) }
        action new_header { document.header }
        action header_name { document.header_char(data[fpc]) }
        action newline { document.newline }
        action new_div { document.div }
        action tag_id { document.id_char(data[fpc]) }
        action tag_class { document.class_char(data[fpc]) }
        action start_id { document.start_id }
        action start_class { document.start_class }
        action auto_close { document.auto_close }

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
        raise self.class::Error.new(parse_error(text, p))
      end

      document.compile
    end

    def parse_error(text, p)
      coords = linecol(text, p)
      buf = "At #{coords.join(':')}:#{p}\n"

      lines = text.lines

      start, finish = coords[0]-3, coords[0]+3
      start = 0 if start < 0

      (start..finish).each do |line|
        l = lines[line]
        unless l.nil?
          buf << "#{line}: #{l.inspect}\n"
        end
      end
      buf
    end

    def linecol(text, p)
      line = 0
      col = 0
      text.chars.each_with_index do |c, i|
        if i == p
          col += 1
          break
        elsif c == "\n"
          line += 1
          col = 0
        else
          col += 1
        end
      end
      [line, col]
    end
  end
end

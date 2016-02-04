
module RParser
  class Tag
    attr_reader :indentation, :name, :attributes
    def initialize(indentation)
      @indentation = indentation
      @name = ""
      @attributes = []
    end
  end

  class Attribute
    attr_reader :name
    attr_accessor :value
    def initialize
      @name = ""
    end
  end

  class Variable
    attr_reader :name
    def initialize
      @name = ""
    end
  end

  ParseError = Class.new(StandardError)

  def self.parse(text)
    cs = 0
    data = text
    p = 0
    pe = text.length
    top = 0
    stack = []

    indentation = 0
    tags = []
    tag = nil

    %%{
      machine chaml_rparser;

      action indent { indentation += 1 }

      action new_tag {
        tag = Tag.new(indentation)
        tags << tag
        indentation = 0
      }

      action tag_name {
        tag.name << data[fpc]
      }

      action new_attribute {
        tag.attributes << Attribute.new
      }

      action attribute_name {
        tag.attributes.last.name << data[fpc]
      }

      action new_attribute_var {
        tag.attributes.last.value = Variable.new
      }

      action attribute_var_name {
        tag.attributes.last.value.name << data[fpc]
      }

      action new_attribute_str {
        tag.attributes.last.value = ""
      }

      action attribute_str_char {
        tag.attributes.last.value << data[fpc]
      }

      include chaml_common "common.rl";
      write data;
      write init;
      write exec;
    }%%
    if cs != chaml_rparser_first_final
      raise ParseError.new(text, p)
    end
    tags
  rescue => ex
    puts "#{ex.class}: #{ex.message}"
    puts "Position: #{linecol(text, p).join(":")}"
  end

  private

  def self.linecol(text, p)
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

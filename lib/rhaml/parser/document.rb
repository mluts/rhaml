class RHaml::Parser::Document < ::MicroMachine
  def initialize(data, indentation)
    @data = data
    @stack = Stack.new
    @indentation = indentation

    super(:start)

    {
      mark_element: {
        :start    =>  :writing_element,
        :pending  =>  :writing_element
      },

      write_element: {
        :writing_element => :in_element
      },

      mark_attr_name: {
        :in_element => :writing_attr_name
      },

      write_attr_name: {
        :writing_attr_name => :writing_attr
      },

      mark_attr_val: {
        :writing_attr => :writing_attr_val
      },

      write_attr_val: {
        :writing_attr_val => :in_attr
      },

      indent: {
        :pending => :pending
      },

      terminate: {
        :in_attr => :pending,
        :in_element => :pending
      }
    }.each do |event, transitions|
      self.when(event, transitions)
      end
  end

  def mark_element(element_name, p)
    trigger(__method__.to_sym)
    @element = [element_name.to_sym, p]
  end

  def write_element(p)
    trigger(__method__.to_sym)
    @element[1] = @data[@element[1]..p]
    if @indentation.index.nil?
      raise "Wrong indentation: #{@indentation.count}, expected: #{(@indentation.count / @indentation.step.to_f).ceil}"
    else
      @stack.slice(@indentation.index + 1)
    end
    @stack.push(@element)
  end

  def mark_attr_name(attr_name, p)
    trigger(__method__.to_sym)
    @attr = [attr_name, p, '']
  end

  def write_attr_name(p)
    trigger(__method__.to_sym)
    @attr[1] = @data[@attr[1]..p]
  end

  def mark_attr_val(p)
    trigger(__method__.to_sym)
    @attr[2] = p
  end

  def write_attr_val(p)
    trigger(__method__.to_sym)
    @attr[2] = @data[@attr[2]..p]
  end

  def mark_inline_text(p)
    trigger(__method__.to_sym)
    @inline_text = p
  end

  def write_inline_text(p)
    trigger(__method__.to_sym)
    @inline_text = @data[@inline_text..p]
  end

  def terminate
    trigger(__method__.to_sym)
    @indentation.reset
  end

  def indent(char)
    trigger(__method__.to_sym)

    if char != @indentation.char
      raise "Wrong indentation char: #{char.inspect}, expected #{@indentation.char}"
    end

    @indentation.increment
  end
end

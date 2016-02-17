class RHaml::Parser::Document < ::MicroMachine
  def initialize(data, indentation)
    @data = data
    @stack = RHaml::Parser::Stack.new
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
        :in_element => :writing_attr_name,
        :in_attr => :writing_attr_name
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

      mark_id_div: {
        :pending => :writing_id_div,
        :start => :writing_id_div
      },

      write_id_div: {
        :writing_id_div => :in_element
      },

      mark_class_div: {
        :pending => :writing_class_div,
        :start => :writing_class_div
      },

      write_class_div: {
        :writing_class_div => :in_element
      },

      mark_class: {
        :in_element => :writing_class
      },

      write_class: {
        :writing_class => :in_element
      },

      mark_id: {
        :in_element => :writing_id
      },

      write_id: {
        :writing_id => :in_element
      },

      mark_inline_text: {
        :in_attr => :writing_inline_text,
        :in_element => :writing_inline_text,
        :in_header => :writing_inline_text
      },

      write_inline_text: {
        :writing_inline_text => :pending
      },

      indent: {
        :pending => :pending
      },

      write_header: {
        :start => :in_header,
        :pending => :in_header
      },

      terminate: {
        :in_attr => :pending,
        :in_element => :pending,
        :writing_attr => :pending,
        :in_header => :pending
      }
    }.each { |event, transitions| self.when(event, transitions) }
  end

  def write_header
    trigger!(__method__.to_sym)
    @element = [:header]
    push(@element)
  end

  def mark_element(element_name, p)
    trigger!(__method__.to_sym)
    @element = [element_name.to_sym, p]
  end

  def write_element(p)
    trigger!(__method__.to_sym)
    @element[1] = @data[@element[1]..p]
    push(@element)
  end

  def mark_attr_name(p)
    trigger!(__method__.to_sym)
    @attr = [:attr, p, '']
    @stack.top << @attr
  end

  def write_attr_name(p)
    trigger!(__method__.to_sym)
    @attr[1] = @data[@attr[1]..p]
  end

  def mark_attr_val(p)
    trigger!(__method__.to_sym)
    @attr[2] = p
  end

  def write_attr_val(p)
    trigger!(__method__.to_sym)
    @attr[2] = @data[@attr[2]..p]
  end

  def mark_inline_text(p)
    trigger!(__method__.to_sym)
    @inline_text = p
  end

  def write_inline_text(p)
    trigger!(__method__.to_sym)
    @inline_text = @data[@inline_text..p]
    @element << [:inline, @inline_text]
  end

  def terminate
    trigger!(__method__.to_sym)
    @indentation.reset
  end

  def mark_id_div(p)
    trigger!(__method__.to_sym)
    @attr = [:attr, 'id', p]
    @element = [:tag, 'div', @attr]
  end

  def write_id_div(p)
    trigger!(__method__.to_sym)
    @attr[2] = @data[@attr[2]..p]
    push(@element)
  end

  def mark_class_div(p)
    trigger!(__method__.to_sym)
    @attr = [:attr, 'class', p]
    @element = [:tag, 'div', @attr]
  end

  def write_class_div(p)
    trigger!(__method__.to_sym)
    @attr[2] = @data[@attr[2]..p]
    push(@element)
  end

  def mark_class(p)
    trigger!(__method__.to_sym)
    @attr = [:attr, 'class', p]
  end

  def write_class(p)
    trigger!(__method__.to_sym)
    @attr[2] = @data[@attr[2]..p]
    @element << @attr
  end

  def mark_id(p)
    trigger!(__method__.to_sym)
    @attr = [:attr, 'id', p]
  end

  def write_id(p)
    trigger!(__method__.to_sym)
    @attr[2] = @data[@attr[2]..p]
    @element << @attr
  end

  def indent(char)
    trigger!(__method__.to_sym)

    if char != @indentation.char
      raise "Wrong indentation char: #{char.inspect}, expected #{@indentation.char.inspect}"
    end

    @indentation.increment
  end

  def compile
    @stack.bottom.dup
  end

  private

  def push(element)
    if @indentation.index.nil?
      raise "Wrong indentation: #{@indentation.count}, expected: #{(@indentation.count / @indentation.step.to_f).ceil}"
    else
      @stack.slice(@indentation.index + 1)
    end
    @stack.push(element)
  end

  def append_to_element(element)
    @stack.top << element
  end
end

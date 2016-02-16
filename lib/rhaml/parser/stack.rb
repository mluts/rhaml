class RHaml::Parser::Stack
  def initialize
    @stack = [[]]
  end

  def top
    @stack.last
  end

  def bottom
    @stack.first
  end

  def push(element)
    @stack << element
  end

  def slice(i)
    raise "Can't slice under 1" if i.to_i < 1
    @stack.slice!(i..-1)
  end
end

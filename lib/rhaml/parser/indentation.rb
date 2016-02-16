class RHaml::Parser::Indentation
  attr_reader :step, :char, :count

  def initialize(char, step)
    @char, @step = char, step
    @count = 0
  end

  def increment
    @count += 1
  end

  def reset
    @count = 0
  end

  def index
    @count / @step if @count % @step == 0
  end
end

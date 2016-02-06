module RHaml
  class Document
    class Indentation
      Error = Class.new(RHaml::Error)

      attr_reader :char, :step, :index, :line

      def initialize
        @char = nil
        @count = 0
        @step = nil
        @line = 0
      end

      def tab
        if @char == " "
          raise self.class::Error.new("Used spaces for indentation, but met tab!")
        end
        @char ||= "\t"
        @count += 1
      end

      def space
        if @char == "\t"
          raise self.class::Error.new("Used tabs for indentation, but met space!")
        end
        @char ||= " "
        @count += 1
      end

      def newline
        @line += 1
        @count = 0
      end

      def index
        if @count == 0
          0
        else
          @step ||= @count
          if (@count < @step) ||
            (index = @count / @step) == 0
            raise self.class::Error.new("Indented #{@count} of #{@char.inspect} on line #{@line}, but have #{@count} instead")
          else
            index
          end
        end
      end
    end
  end
end

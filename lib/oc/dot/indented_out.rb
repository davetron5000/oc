module Oc
  module DOT
    class IndentedOut
      def initialize(out)
        @out = out
        @indent = 2
      end
      def puts(string)
        @out.puts (" " * @indent) + string
      end

      def indent(&block)
        @indent += 2
        block.()
        @indent -= 2
      end
    end
  end
end

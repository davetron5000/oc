require_relative "person"

module Oc
  module People
    class ParsedPeople
      def initialize(hash)
        @hash = hash
      end

      def people(&block)
        @hash["team"]["members"].map(&Oc::People::Person).each(&block)
      end
    end
  end
end

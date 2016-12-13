require_relative "division"

module Oc
  module OrgStructure
    class ParsedOrg
      def initialize(hash)
        @hash = hash
      end

      def divisions(&block)
        @hash["divisions"].map(&Oc::OrgStructure::Division).each(&block)
      end

    end
  end
end

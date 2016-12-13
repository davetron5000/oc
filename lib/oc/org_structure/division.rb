require_relative "team"

module Oc
  module OrgStructure
    class Division
      def self.to_proc
        ->(h) { Division.new(h) }
      end

      attr_reader :id, :name
      def initialize(hash)
        @hash = hash
        @id   = "division_#{@hash['name']}"
        @name = @hash["label"] || @hash["name"]
      end

      def multiple_teams?
        @hash["teams"].size > 1
      end

      def teams(&block)
        @hash["teams"].map(&Oc::OrgStructure::Team).each(&block)
      end
    end
  end
end

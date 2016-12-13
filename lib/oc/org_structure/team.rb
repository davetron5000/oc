module Oc
  module OrgStructure
    class Team
      def self.to_proc
        ->(h) { Team.new(h) }
      end

      attr_reader :id, :name, :reports_to
      def initialize(hash)
        @hash       = hash
        @id         = @hash['name']
        @name       = @hash["label"] || @hash["name"]
        @reports_to = @hash["reportsTo"]
      end

      def org(&block)
        @hash["org"].each(&block)
      end
    end
  end
end

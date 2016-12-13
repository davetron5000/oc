module Oc
  module People
    class Person
      def self.to_proc
        ->(id,hash) { self.new(id,hash) }
      end

      attr_reader :id,:name, :title
      def initialize(id,hash)
        @id = id
        @name = hash["name"]
        @title = hash["title"]
      end
    end
  end
end

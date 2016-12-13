require_relative "people/parsed_people"

module Oc
  module People
    def self.from_json(json)
      Oc::People::ParsedPeople.new(JSON.parse(json))
    end
  end
end

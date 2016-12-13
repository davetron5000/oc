require 'json'
require_relative "org_structure/parsed_org"

module Oc
  module OrgStructure
    def self.from_json(json)
      Oc::OrgStructure::ParsedOrg.new(JSON.parse(json))
    end
  end
end

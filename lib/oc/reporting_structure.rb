module Oc
  class ReportingStructure
    def initialize(org)
      @hash = {}
      org.divisions do |division|
        division.teams do |team|
          team.org do |name,reports|
            manager(team.reports_to, has_report: name)
            reports.each do |report|
              manager(name, has_report: report)
            end
          end
        end
      end
    end

    def each(&block)
      @hash.each(&block)
    end

    private

    def manager(manager, has_report: nil)
      @hash[manager] ||= []
      @hash[manager] << has_report
    end
  end

end

return if ENV["rspec_oscal_output"].blank?

require "oscal"
Oscal::ParsingLogger.logger = Rails.logger

RSpecOscalFormatter.configure do |config|
  config.assessment_plan_uuid = SecureRandom.uuid
  config.plan_filename = "trestle://assessment-plans/rspec/assessment-plan.json"
  config.ssp_filename = "trestle://system-security-plans/continuous_monitoring/system-security-plan.json"
end

RSpec.configure do |config|
  if config.files_to_run.one?
    config.add_formatter "doc"
  else
    config.add_formatter "progress"
  end
  oscal_directory = if ENV["rspec_oscal_output"] == "tmp"
    Rails.root.join("tmp", "oscal")
  else
    Rails.root.join("doc/compliance/oscal")
  end
  config.add_formatter RSpecOscalFormatter::PlanFormatter, oscal_directory.join("assessment-plans", "rspec", "assessment-plan.json")
  config.add_formatter RSpecOscalFormatter::ResultsFormatter, oscal_directory.join("assessment-results", "rspec", "assessment-results.json")
end

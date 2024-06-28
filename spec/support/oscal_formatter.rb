Oscal::ParsingLogger.logger = Rails.logger
RSpec::RSpecOscalFormatter::Formatter.output_directory = Rails.root.join("tmp", "oscal_assessment")
RSpec::RSpecOscalFormatter::Formatter.use_timestamp_dirs = ENV.fetch("rspec_oscal_timestamp", "true") == "true"
RSpec.configure do |config|
  if config.files_to_run.one?
    config.add_formatter "doc"
  else
    config.add_formatter "progress"
  end
  config.add_formatter RSpec::RSpecOscalFormatter::Formatter
end

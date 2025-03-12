source "https://rubygems.org"

ruby "3.3.4"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.0"

gem "propshaft"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
gem "thruster", "~> 0.1"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

gem "secure_headers", "~> 7.1"

gem "sidekiq", "~> 8.0"

gem "pundit", "~> 2.3"
gem "devise", "~> 4.9"
gem "faraday", "~> 2.12"
gem "faraday-typhoeus", "~> 1.1"

group :development, :test do
  gem "rspec-rails", "~> 7.1"
  gem "dotenv-rails", "~> 3.1"
  gem "brakeman", "~> 7.0"
  gem "bundler-audit", "~> 0.9"
  gem "standard", "~> 1.44"
  gem "i18n-tasks", "~> 1.0"
end

group :development do
  gem "rails_template_18f", github: "gsa-tts/rails-template", branch: "main"
  gem "rails-erd", "~> 1.7"
end

group :test do
  gem "climate_control", "~> 1.0"
  gem "shoulda-matchers", "~> 6.2"
  gem "rspec_oscal_formatter", github: "gsa-tts/rspec_oscal_formatter", branch: "main"
  # gem "rspec_oscal_formatter", path: "/Users/ryancahearn/software/devtools/oscal/rspec_oscal_formatter"
  gem "byebug", "~> 11.1"
end
gem "i18n-js", "~> 4.2"
gem "listen", "~> 3.9", group: :development

source "https://rubygems.org"

gem "rails", "~> 8.0.2" # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"

gem "pg", "~> 1.1"      # Use postgresql as the database for Active Record

gem "propshaft"         # The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "puma", ">= 5.0"    # Use the Puma web server [https://github.com/puma/puma]
gem "importmap-rails"   # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "turbo-rails"       # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "stimulus-rails"    # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "jbuilder"          # Build JSON APIs with ease [https://github.com/rails/jbuilder]

# Bootstrap
gem "sprockets-rails"
gem "bootstrap"
gem "jquery-rails"
gem "sassc-rails"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "bootsnap", require: false # Reduces boot times through caching; required in config/boot.rb
# gem "kamal", require: false    # Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "thruster", require: false # Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]

# Authentication
gem "devise", "~> 4.9"
# gem "pundit", "~> 2.3"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  gem "brakeman", require: false
  gem "byebug", require: false
  gem "factory_bot", require: false
  gem "fasterer", require: false
  gem "ffaker", require: false
  gem "rails-erd", require: false
  gem "reek", require: false
  gem "rspec-rails", require: false
  gem "rubocop-rails-omakase", require: false
  gem "shoulda-matchers", require: false
  gem "simplecov", require: false

  gem "capybara",                      require: false
  gem "selenium-webdriver", "~> 4.31", require: false # required by capybara...

  gem "rails-controller-testing"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

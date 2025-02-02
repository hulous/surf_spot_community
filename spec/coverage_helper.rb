if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start do
    add_filter "/spec/"
    add_filter "/config/"
  end

  SimpleCov.minimum_coverage 90
end

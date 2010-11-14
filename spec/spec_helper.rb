# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV['RAILS_ENV'] = 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'machinist/active_record'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each { |f| require f }

Rspec.configure do |config|
  config.mock_with :rr
  #config.fixture_path = "#{::Rails.root}/spec/blueprints"
  config.use_transactional_fixtures = true
end
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rails'
require 'active_record'
require 'active_record/railtie'
require 'stripetie'
require 'stripe_mock'
require 'factory_girl'
require 'faker'
require 'database_cleaner'
# require 'rspec/rails'

#Require factory files
Dir[File.expand_path('/factories/*.rb', __FILE__)].each do |file|
  require file
end

#Establish database connection
ActiveRecord::Base.establish_connection adapter: "postgresql"
ActiveRecord::Base.connection.execute('DROP TABLE "customers" CASCADE')

RSpec.configure do |config|
  #Set up FactoryGirl
  config.include FactoryGirl::Syntax::Methods

  # config.active_record.maintain_test_schema = false

  FactoryGirl.find_definitions
  config.before(:each) do
    #Destroy existing records
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
end

#Load schema
load File.dirname(__FILE__) + '/schema.rb'

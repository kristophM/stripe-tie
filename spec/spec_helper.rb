$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rails'
require 'active_record'
require 'stripetie'
require 'stripe_mock'
require 'factory_girl'
require 'faker'

#Require factory files
Dir[File.expand_path('/factories/*.rb', __FILE__)].each do |file|
  require file
end

#Establish database connection
ActiveRecord::Base.establish_connection adapter: "postgresql"
load File.dirname(__FILE__) + '/schema.rb'

#Set up FactoryGirl
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end
end

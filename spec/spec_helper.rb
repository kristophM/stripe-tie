$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rails'
require 'active_record'
require 'stripetie'
#Require all model classes explicitly
Dir[File.expand_path('../../lib/generators/stripetie/templates/*.rb', __FILE__)].each do |file|
  require file
end
#Establish database connection
ActiveRecord::Base.establish_connection adapter: "postgresql"
load File.dirname(__FILE__) + '/schema.rb'

require "stripetie/version"

module Stripetie
  require 'stripetie/engine' if defined?(Rails)

  #Initializers
  Stripetie::ACCOUNT_CLASS = 'Account'
  puts "stripetie #{Stripetie::ACCOUNT_CLASS}"

  #Require all model classes explicitly
  Dir[File.expand_path('../../lib/generators/stripetie/templates/*.rb', __FILE__)].each do |file|
    require file
  end
  #Also require module files
  Dir[File.expand_path('../../lib/stripetie/*.rb', __FILE__)].each do |file|
    puts "required file #{file}"
    require file
  end
  #Also require model classes that aren't part of generators
  Dir[File.expand_path('../../lib/stripetie/models/*.rb', __FILE__)].each do |file|
    puts "required model file #{file}"
    require file
  end
end

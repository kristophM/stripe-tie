require 'rails/generators/base'
require 'rails/generators'

module Stripetie
  class InstallGenerator < Rails::Generators::Base
    desc "This generator creates an initializer file at config/initializers"
    source_root File.expand_path("../stripe_modelizer/templates", __FILE__)

    ['invoice', 'invoice_item', 'balance_transaction', 'refund', 'charge'].each do |class|
      copy_model_file(class)
    end

    private
    def copy_model_file(file_name)
      copy_file "#{file_name}.rb", "app/models/stripe/#{file_name}.rb"
    end
  end
end

require 'rails/generators/base'
require 'rails/generators'

module Stripetie
  class InstallGenerator < Rails::Generators::Base
    desc "This generator creates an initializer file at config/initializers"
    source_root File.expand_path("../templates", __FILE__)

    MODELS = ['invoice', 'invoice_item', 'balance_transaction', 'refund', 'charge']

    def copy_all_model_files
      MODELS.each do |class_name|
        copy_model_file class_name
      end
    end

    def copy_migrations
      migration_template "migrations/add_stripe_models.rb", "db/migrate/add_stripe_models.rb"
    end

    private
    def copy_model_file(file_name)
      copy_file "#{file_name}.rb", "app/models/#{file_name}.rb"
    end
  end
end

# Stripetie

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/stripetie`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stripetie'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stripetie

### Stripe models and migrations

To install the Stripe models (e.g. Invoices, Charges, etc.) and their respective migrations, run:
    $ rails g install stripetie

Existing models will be overwritten. Any existing database tables will not be overwritten, but rather, new columns will be added/overwritten if they are missing or differ from the Stripetie migration script.

###Special models

####Customer

Because you will probably have your own *Customer* model and will want to relate it to Stripe, Stripetie allows you to include special methods for both to coexist. Insert the following in your Customer class:
  ```ruby
    class Customer < ActiveRecord::Base
      include Stripetie::Customer
    end
  ```

####Account (for Stripe Connect managed accounts only)

If you are using Stripe Connect (e.g. for Marketplaces or multitenant SaaS systems), you will be managing multiple accounts and not just one Stripe account. In this scenario, your Customer, Invoice, Transaction records, etc. will be scoped by Account. It is advisable to name your account model as Account, Company or something sensible like that. Then, insert the following into the class (of course replacing Account with whatever you name it):
  ```ruby
    class Account < ActiveRecord::Base
      include Stripetie::Account
    end
  ```


## Usage

Todo.........................

###Standard Stripe model methods

###Customer methods

###Account methods

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/stripetie. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

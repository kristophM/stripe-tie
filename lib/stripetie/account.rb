module Stripetie
  module Account
    def self.included(base)
      base.class_eval do
        before_create :create_stripe_account
        has_many :customers, dependent: :destroy
      end
    end

    def create_stripe_account(specified_country = nil)
      Stripe.api_key = ENV['STRIPE_PLATFORM_SECRET_KEY']
      stripe_account = Stripe::Account.create(
        managed: true,
        country: specified_country ||= self.country #! This means we need to add this to migration
      )
      self.stripe_account_id = stripe_account['id']
    end
  end
end

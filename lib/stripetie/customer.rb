module Stripetie
  module Customer
    def self.included(base)
      base.class_eval do
        has_many :invoices
        belongs_to :account
        #! Fill in all the other has_many, belong_to, etc.
      end
    end
    #Create and associate stripe customer ID to a customer
    def create_and_associate_stripe_customer(stripe_token, account_id = nil)
      Stripe.api_key = ENV['STRIPE_PLATFORM_SECRET_KEY']
      stripe_account_id = Account.find_by_id(account_id).try(:stripe_account_id) #! Need to make 'Account' model name dynamic
      if stripe_account_id
        stripe_customer = Stripe::Customer.create({source: stripe_token},{stripe_account: stripe_account_id})
      else
        stripe_customer = Stripe::Customer.create(source: stripe_token)
      end
      self.stripe_customer_id = stripe_customer['id']
      self.save!
    end

    #Retrieve the Stripe customer object from Stripe
    def stripe_customer(account_id = nil)
      Stripe.api_key = ENV['STRIPE_PLATFORM_SECRET_KEY']
      stripe_account_id = ::Account.find_by_id(account_id).try(:stripe_account_id)
      if stripe_account_id
        Stripe::Customer.retrieve(self.stripe_customer_id)
      else
        Stripe::Customer.retrieve(self.stripe_customer_id, {stripe_account: stripe_account_id})
      end
    end

    def cards
      sc = self.stripe_customer
      cards = sc.sources.all.as_json['data']
    end
  end
end

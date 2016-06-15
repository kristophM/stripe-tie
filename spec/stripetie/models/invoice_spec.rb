require 'spec_helper'
require 'pry'

describe Invoice do
  let(:stripe_helper) { StripeMock.create_test_helper }
  let(:customer) { FactoryGirl.create(:customer) }

  before :each do
    StripeMock.start
    account = FactoryGirl.create(:account)
    3.times do
      customer.stripe_customer_id = Stripe::Customer.create({
        email: 'johnny@appleseed.com',
        card: stripe_helper.generate_card_token
      }).id
      customer.account_id = account.id
      customer.save!
      stripe_invoice = Stripe::Invoice.create(
        customer: customer.stripe_customer_id,
        metadata: {product_id: 1}
      )
      invoice = Invoice.create!(stripe_invoice.as_json.except('customer'))
      invoice.update_attributes!(customer: Customer.find_by_stripe_customer_id(stripe_invoice.as_json['customer']))
    end
  end
  after { StripeMock.stop }

  context "scoping" do
    it "can be sorted by account holder ID" do
      puts "invoices by account #{Invoice.by_account(customer.account_id).inspect}"
      expect(Invoice.by_account(customer.account_id).length).to be > 0
    end

    it "can be sorted by customer ID" do
      puts "invoices by customer #{Invoice.by_customer(customer.id).inspect}"
      expect(Invoice.by_customer(customer.id).length).to be > 0
    end

    xit "can be sorted by custom metadata parameter ID" do
    end
  end

  xit "Activerecord associations work"
  # Both belong_to and has_many, count them

  it "can save the Stripe object into local cache" do
    stripe_invoice = Stripe::Invoice.create(
      customer: customer.stripe_customer_id,
      metadata: {product_id: 1}
    )
    invoice2 = Invoice.new(stripe_invoice.as_json.except('customer'))
    invoice2.update_attributes!(customer: customer)
    expect(invoice2.valid?).to be true
  end

  xit "can be synced from Stripe" do
    #via webhook
  end
end

require 'spec_helper'

describe Invoice do
  let(:stripe_helper) { StripeMock.create_test_helper }
  let(:customer) { FactoryGirl.create(:customer) }

  before do
    StripeMock.start
    3.times do
      customer.stripe_customer_id = Stripe::Customer.create({
        email: 'johnny@appleseed.com',
        card: stripe_helper.generate_card_token
      }).id
      customer.save!
      stripe_invoice = Stripe::Invoice.create(
        customer: customer.stripe_customer_id,
        metadata: {product_id: 1}
      )
      invoice = Invoice.create!(stripe_invoice.as_json)
    end
  end
  after { StripeMock.stop }

  context "scoping" do
    it "can be sorted by account holder ID" do

    end

    it "can be sorted by customer ID" do
      expect(Invoice.by_customer(customer.id).length).to be > 0
    end

    xit "can be sorted by custom metadata parameter ID" do
    end
  end

  it "can save the Stripe object into local cache" do
    stripe_invoice = Stripe::Invoice.create(
      customer: customer.stripe_customer_id,
      metadata: {product_id: 1}
    )
    invoice2 = Invoice.new(stripe_invoice.as_json)
    expect(invoice2.valid?).to be true
  end

  xit "can be synced from Stripe" do
    #via webhook
  end
end

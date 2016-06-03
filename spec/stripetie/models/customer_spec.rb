require 'spec_helper'

describe Customer do
  #Write tests for helper methods in Customer model (use Rolify as an example)
  #Should have attribute for stripe_customer_id
  let(:stripe_helper) { StripeMock.create_test_helper }
  let(:customer) {FactoryGirl.create(:customer)}

  before do
    StripeMock.start
    3.times do
      customer.stripe_customer_id = Stripe::Customer.create({
        email: 'johnny@appleseed.com',
        card: stripe_helper.generate_card_token
      }).id
      customer.save!
    end
  end
  after { StripeMock.stop }

  it "retrieves the Stripe Customer object associated with the local Customer object's stripe_customer_id" do
    expect(customer.stripe_customer).to be_an_instance_of Stripe::Customer
  end

  it "generates a Stripe customer object upon local Customer object creation and associates the Stripe customer ID"

  it "returns the cards associated with a customer"

  it "can function correctly without belonging to an Account (for non-Stripe Connect systems)"

end

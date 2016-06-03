require 'spec_helper'

describe Account do
  #Write tests for helper methods in Company model (use Rolify as an example)
  #Should have attribute for stripe_account_id
  let(:stripe_helper) { StripeMock.create_test_helper }
  let(:account) {FactoryGirl.create(:account)}

  before { StripeMock.start }
  after { StripeMock.stop }

  it "creates a Stripe account associated with the newly created local Account" do
    expect(Stripe::Account.all.as_json['data'].length).to eq 1
  end
end

require 'spec_helper'

describe Stripetie do
  it 'has a version number' do
    expect(Stripetie::VERSION).not_to be nil
  end

  it 'generates models for all Stripe objects' do  #! Start with Postgres and later move to Mongoid
    #Test for ALL stripe objects
  end

  it 'generates migration file for all Stripe objects if ActiveRecord is selected' do
  end

  it 'creates tables if they do not yet exist' do

  end

  it 'adds new columns only if they do not already exist'

  it 'generates a webhooks controller and routes' do
    #! Or should this be something that's strictly internal?
  end
end

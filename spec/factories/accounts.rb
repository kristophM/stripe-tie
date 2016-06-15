FactoryGirl.define do
  factory :account do
    name {Faker::Name.name}
    # country 'us'
  end
end

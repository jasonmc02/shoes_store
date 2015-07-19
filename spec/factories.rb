FactoryGirl.define do
  factory :store do
    name "store #{SecureRandom.base64(6)}"
    address "ramdon address #{SecureRandom.base64(6)}"
  end

  factory :article do
    association :store, factory: :store
    name "article #{SecureRandom.base64(6)}"
    description "article description"
    price "100"
    total_in_shelf "10"
    total_in_vault "20"
  end
end
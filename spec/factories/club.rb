FactoryGirl.define do
  factory :club do

    name {Faker::Name.name}
    trait :active do
      status{'active'}
    end

    trait :upcoming do
      status{'upcoming'}
    end

    trait :archived do
      status{'archived'}
    end

    trait :closed do
      status{'closed'}
    end



  end
end

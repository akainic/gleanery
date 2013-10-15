FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "kalequeen#{n}" }
    sequence(:email) { |n| "kalequeen#{n}@example.com" }
    password 'Greens101'
    password_confirmation 'Greens101'
  end

  factory :restaurant do
    name 'Life Alive'
    neighborhood 'Central Square'
    street_address '765 Massachusetts Ave'
    city 'Cambridge'
  end

  factory :rating do
    restaurant
    user

    vegan 1
    vegetarian 1
    gluten_free 1
  end
end


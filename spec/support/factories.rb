FactoryGirl.define do 
  factory :user do
    username 'kalequeen'
    email 'kalequeen@example.com'
    password 'Greens101'
    password_confirmation 'Greens101'
  end

  factory :restaurant do
    name 'Life Alive'
    neighborhood 'Central Square'
    street_address '765 Massachusetts Ave'
    city 'Cambridge'
  end
end


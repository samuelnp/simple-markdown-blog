FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password 'example.password'
    password_confirmation 'example.password'
  end
end
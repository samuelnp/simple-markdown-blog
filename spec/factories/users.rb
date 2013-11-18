FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password 'qwerty123456'
    password_confirmation 'qwerty123456'
  end
end
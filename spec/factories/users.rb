# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'dunyakirkali@gmail.com'
    password 'dE3kI812'
    password_confirmation 'dE3kI812'
    name 'Dunya Kirkali'
    born_on { Time.new(1984, 5, 11) }
  end
end

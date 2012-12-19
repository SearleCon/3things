# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plan do
    name "MyString"
    duration 1
    price "9.99"
    active false
    is_free false
  end
end

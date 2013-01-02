# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment_notification do
    user_id 1
    transaction_id 1
    status "MyString"
  end
end

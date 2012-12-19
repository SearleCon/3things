# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    plan_id 1
    user_id 1
    expiry_date "2012-11-28"
  end
end

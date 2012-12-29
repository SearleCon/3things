# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title "MyString"
    description "MyText"
    association :status, :factory => :status, :name => 'Todo'
    association :user, :factory => :user
  end
end

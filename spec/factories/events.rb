# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    user_id 1
    name "MyString"
    details "MyText"
    where "MyString"
    source "MyString"
    whendate "2012-11-09"
    whentime "12:34:01"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    user_id 1
    name "MyString"
    details "MyText"
    where "MyString"
    source "MyString"
    whendate "2012-11-08"
    whentime "2012-11-08 22:39:03"
  end
end

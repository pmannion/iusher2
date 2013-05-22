# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    name "MyString"
    email "MyString"
    category "MyString"
    body "MyText"
  end
end

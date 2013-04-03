# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    company "MyString"
    branch "MyString"
    longitude "9.99"
    latitude "9.99"
    email "MyString"
  end
end

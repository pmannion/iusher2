# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :complaint do
    branch "MyString"
    screen 1
    seat 1
    longitude "9.99"
    latittude "9.99"
    comment "MyString"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    published false
    published_at "2012-10-10"
    body "MyText"
    permalink "MyString"
  end
end

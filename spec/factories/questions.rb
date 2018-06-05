FactoryBot.define do
  factory :question do
    content "MyString"
    source "MyString"
    year "MyString"
    association :option
    association :review
  end
end

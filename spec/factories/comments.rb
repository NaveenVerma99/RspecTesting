FactoryBot.define do
  factory :comment do
    user_name { "MyString" }
    body { "MyText" }
    post { nil }
  end
end

FactoryBot.define do
  factory :goal do
    title { "MyString" }
    details { "MyText" }
    private { false }
    completed { false }
    deadline { "2019-12-10" }
  end
end
